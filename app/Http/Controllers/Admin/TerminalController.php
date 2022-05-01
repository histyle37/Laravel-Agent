<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Terminal;
use Illuminate\Support\Facades\Input;
use Validator;
use Datatables;

class TerminalController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.terminal.index');
    }

    public function create()
    {
        return view('admin.terminal.create');
    }

    public function datatables()
    {
        $datas = Terminal::orderBy('no')->get();
        //--- Integrating This Collection Into Datatables
        return Datatables::of($datas)
                ->addColumn('action', function(Terminal $data) {
                    $delete ='<a href="javascript:;" data-href="' . route('admin-terminal-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                    return '<div class="action-list"><a data-href="' . route('admin-terminal-edit',$data->id) . '" class="edit" data-toggle="modal" data-target="#modal1"> <i class="fas fa-edit"></i>Edit</a>'.$delete.'</div>';
                })
                ->rawColumns(['action'])
                ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'no'      => 'required|numeric'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Terminal();
        $input = $request->all();
        $data->fill($input)->save();
        //--- Logic Section Ends
        //--- Redirect Section        
        $msg = 'New Terminal Added Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Terminal::findOrFail($id);  
        return view('admin.terminal.edit',compact('data'));
    }
    
    //*** POST Request
    public function update(Request $request,$id) {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'no'      => 'required|numeric'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        $data = Terminal::find($id);
        $input = $request->all();
        $data->update($input);
        $msg = 'Data Updated Successfully.';
        //reset other terminal's current column
        return response()->json($msg);
    }

     //*** GET Request Delete
     public function destroy($id)
     {
         $data = Terminal::find($id);
         $data->delete();
         //--- Redirect Section     
         $msg = 'Data Deleted Successfully.';
         return response()->json($msg);      
         //--- Redirect Section Ends    
     }
}
