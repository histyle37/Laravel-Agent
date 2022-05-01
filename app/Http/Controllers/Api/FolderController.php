<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;
use Carbon\Carbon;

use App\Models\Folder;
use App\Models\DesignFolder;
use App\Models\MediaFolder;

use App\Classes\DesignHelper;
use App\Classes\PhotoHelper;
use App\Classes\MediaIdHelper;
use App\Classes\FolderHelper;

class FolderController extends BaseController
{
    public function __construct()
    {
    }

    public function get(Request $request, $id)
    {
        $user = Auth::user();
        $folderTypes = $request->folderTypes;
        $type = ($folderTypes == 'DESIGN') ? 0 : 1;

        $folders = $user->folders()->where('type', $type)->get()->map(function($folder) use($user) {
            $item = $folder->JsonModel();
            return $item;
        });

        if ($id == '~')
        {
            $projections = $request->projections;
            $limit = $request->limit;
            $user = $request->user;
    
            $data = array(
                'folders' => $folders,
                "continuation" => false
            );
        }
        else
        {
            $folder = Folder::where('mediaId', $id)->first();
            if ($folder){
                if ($folder->type == 0){
                    $designs = $folder->designs()->where('is_trashed', 0)->get()->map(
                        function ($design){ return $design->JsonModel(); }
                    );

                    $data = array(
                        "items" => $designs,
                        "folders" => $folders,
                        "continuation" => false
                    );
                }
                else 
                {
                    $photos = $folder->photos->map(
                        function($photo) use($folder){
                            $photoJson = $photo->JsonModel();
                            $thumbnailFile = $photoJson["bundle"]["files"]["THUMBNAIL"];
                            return [
                                "type" => "MEDIA",
                                "id" => $photo->mediaId,
                                "name" => $photo->title,
                                "version" => $photo->version,
                                "timestamp" => (int)$photo->updated_at->format('U'),
                                "thumbnail" => [
                                    "width" => $thumbnailFile->width,
                                    "height" => $thumbnailFile->height,
                                    "url" => $thumbnailFile->url,
                                    "version" => $thumbnailFile->version
                                ],
                                "media" => $photoJson
                            ];
                        }
                    );

                    $data = array(
                        "items" => $photos,
                        "continuation" => null
                    );
                }
            } else {
                $data = array(
                    "success" => false
                );
            }
        }

        return $this->sendResponse($data);
    }

    public function create(Request $request)
    {
        $user = Auth::user();
        $name = $request->name;
        $type = $request->type == 'DESIGN' ? 0 : 1;

        $mediaId = MediaIdHelper::generate("FOLDER");

        $folder = Folder::create([
            'mediaId' => $mediaId,
            'name' => $name,
            'type' => $type,
            'user_id' => $user->id
        ]);

        $data = [
            'folder' => $folder->JsonModel(),
            'access' => true
        ];

        return $this->sendResponse($data);
    }

    public function setFolderSetting(Request $request)
    {
        $user = Auth::user();
        $folder = $request->folder;
        $folderId = $folder['id'];
        $folder = Folder::where('mediaId', $folderId)->first();

        
        if ($request->has('trash') && $request->trash){
            $data = array(
                "folder" => $folder->JsonModel(),
                "access" => 1,
                "accessSummary" => [
                    "users" => [
                        $user->JsonModel()
                    ],
                    "others" => 0
                ]
            );
           
            $folder->designFolders()->delete();
            $folder->delete();

            return $this->sendResponse($data);
        }

        if ($request->has('moveItems')){
            $from = $request->from;
            $fromId = $from['id'];
            $items = $request->items;
            $to = $request->to;
            $toId = $to['id'];

            $fromFolder = FolderHelper::getFromMediaId($fromId);
            $toFolder = FolderHelper::getFromMediaId($toId);
            if (!$fromFolder || !$toFolder) return $this->sendError();

            foreach($items as $item){
                $photo = PhotoHelper::getFromMediaId($item);
                if (!$photo) continue;
                $mediaFolder = MediaFolder::where('folder_id', $fromFolder->id)->where('nphoto_id', $photo->id)->first();
                if ($mediaFolder){
                    $mediaFolder->folder_id = $toFolder->id;
                    $mediaFolder->save();
                }
            }

            return $this->sendResponse(['success' => true]);
        }

        if ($request->has('add')){
            $adds = $request->add;

            foreach($adds as $add){
                $designId = $add['id'];
                $type = $add['type'];
    
                $design = DesignHelper::getFromMediaId($designId);
    
                $designFolder = DesignFolder::create([
                    'design_id' => $design->id,
                    'folder_id' => $folder->id
                ]);
            }
    
            $data = array(
                "folder" => $folder->JsonModel(),
                "access" => 1,
                "accessSummary" => [
                    "users" => [
                        $user->JsonModel()
                    ],
                    "others" => 0
                ]
            );

            return $this->sendResponse($data);
        }

        $userSettings = $request->userSettings;
        $starred = $userSettings ? $userSettings['starred'] : null;
        $description = $request->description;
        $name = $request->name;

        if ($description) $folder->description = $description;
        if ($name) $folder->name = $name;
        if ($userSettings) $folder->is_starred = $starred == true ? 1 : 0;

        $folder->save();

        $data = array(
            "folder" => $folder->JsonModel(),
            "access" => 1,
            "accessSummary" => [
                "users" => [
                    $user->JsonModel()
                ],
                "others" => 0
            ]
        );
       
        return $this->sendResponse($data);
    }
}
