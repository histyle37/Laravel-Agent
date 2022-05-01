<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Option;
use Illuminate\Support\Facades\Input;
use Validator;
use Datatables;

class OptionController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.option.index');
    }

    public function create()
    {
        return view('admin.option.create');
    }

    public function datatables()
    {
        $datas = Option::all();
        //--- Integrating This Collection Into Datatables
        return Datatables::of($datas)
                ->addColumn('status', function(Option $data) {
                    $status = $data->status == 1 ? 'Active' : 'Disabled';
                    $class = $data->status == 1 ? 'drop-success' : 'drop-danger';
                    $status_content = '<div class="datatable-badget '.$class.'">'.$status.'</div>';
                    return $status_content;
                }) 
                ->addColumn('action', function(Option $data) {
                    $delete ='<a href="javascript:;" data-href="' . route('admin-option-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                    return '<div class="action-list"><a data-href="' . route('admin-option-edit',$data->id) . '" class="edit" data-toggle="modal" data-target="#modal1"> <i class="fas fa-edit"></i>Edit</a>'.$delete.'</div>';
                })
                ->rawColumns(['action', 'status'])
                ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'commission'      => 'required|numeric',
            'status'      => 'required'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Option();
        $input = $request->all();
        $data->fill($input)->save();
        //--- Logic Section Ends
        //--- Redirect Section        
        $msg = 'New Option Added Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Option::findOrFail($id);  
        return view('admin.option.edit',compact('data'));
    }
    
    //*** POST Request
    public function update(Request $request,$id) {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'commission'      => 'required|numeric',
            'status'      => 'required'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        $data = Option::find($id);
        $input = $request->all();
        $data->update($input);

        $msg = 'Data Updated Successfully.';
        return response()->json($msg);      
    }

     //*** GET Request Delete
     public function destroy($id)
     {
         $data = Option::find($id);
         $data->delete();
         //--- Redirect Section     
         $msg = 'Data Deleted Successfully.';
         return response()->json($msg);      
         //--- Redirect Section Ends    
     }
}
