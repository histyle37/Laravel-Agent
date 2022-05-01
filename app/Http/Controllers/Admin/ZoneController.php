<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Zone;
use App\Models\Option;
use App\Models\OptionZone;

use Illuminate\Support\Facades\Input;
use Validator;
use Datatables;

class ZoneController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.zone.index');
    }

    public function create()
    {
        $options = Option::where('status', 1)->get();
        return view('admin.zone.create', compact('options'));
    }

    public function datatables()
    {
        $datas = Zone::all();
        try{
            $data = Datatables::of($datas)
            ->addColumn('options', function(Zone $data) {
                if ($data->options && $data->options->count() > 0) {
                    $names = $data->options->pluck('name')->toArray();
                    return $names;
                }
                return "";
            })
            ->addColumn('bet1', function(Zone $data) {
                return ($data->bet1) ? '<img class="active-image" src="'.asset('assets/images/check.png').'" />' : '';
            })
            ->addColumn('bet2', function(Zone $data) {
                return ($data->bet2) ? '<img class="active-image" src="'.asset('assets/images/check.png').'" />' : '';
            })
            ->addColumn('loto', function(Zone $data) {
                return ($data->loto) ? '<img class="active-image" src="'.asset('assets/images/check.png').'" />' : '';
            })
            ->addColumn('action', function(Zone $data) {
                $delete ='<a href="javascript:;" data-href="' . route('admin-zone-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                return '<div class="action-list"><a href="' . route('admin-zone-edit',$data->id) . '"> <i class="fas fa-edit"></i>Edit</a>'.$delete.'</div>';
            })
            ->rawColumns(['action', 'bet1', 'bet2', 'loto'])
            ->toJson(); //--- Returning Json Data To Client Side
        } catch (\Exception $e){
            var_dump($e);
            die();
        }
        //--- Integrating This Collection Into Datatables
        return $data;
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'commission'      => 'required|numeric',
            'rt_exp'      => 'required|numeric'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Zone();
        $input = $request->all();
        $data->fill($input)->save();

        if (array_key_exists('option', $input)){
            $data->options()->attach($input['option']);
        }
        //--- Logic Section Ends
        //--- Redirect Section        
        $msg = 'New Zone Added Successfully.'.'<a href="'.route("admin-zone-index").'">View Zone Lists</a>';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Zone::findOrFail($id);  
        $options = Option::where('status', 1)->get();
        return view('admin.zone.edit',compact('data', 'options'));
    }
    
    //*** POST Request
    public function update(Request $request,$id) {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'commission'      => 'required|numeric',
            'rt_exp'      => 'required|numeric'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        $data = Zone::find($id);
        $input = $request->all();

        if (!array_key_exists('gross_percent', $input)) $input['gross_percent'] = 0;
        if (!array_key_exists('bet1', $input)) $input['bet1'] = 0;
        if (!array_key_exists('bet2', $input)) $input['bet2'] = 0;
        if (!array_key_exists('loto', $input)) $input['loto'] = 0;

        $data->update($input);

        $data->options()->detach();
        if (array_key_exists('option', $input)){
            $data->options()->attach($input['option']);
        }

        $msg = 'Data Updated Successfully.'.'<a href="'.route("admin-zone-index").'">View Zone Lists</a>';
        return response()->json($msg);
    }

     //*** GET Request Delete
     public function destroy($id)
     {
         $data = Zone::find($id);
         $data->options()->detach();
         $data->delete();

         $msg = 'Data Deleted Successfully.';
         return response()->json($msg);      
     }
}
