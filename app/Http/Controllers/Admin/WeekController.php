<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Week;
use Illuminate\Support\Facades\Input;
use Validator;
use Datatables;

class WeekController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.week.index');
    }

    public function create()
    {
        return view('admin.week.create');
    }

    public function datatables()
    {
        $datas = Week::all();
        //--- Integrating This Collection Into Datatables
        return Datatables::of($datas)
                ->addColumn('start_date', function(Week $data) {
                    return Carbon::parse($data['start_date'])->format('m/d/Y H:i A');
                })
                ->addColumn('end_date', function(Week $data) {
                    return Carbon::parse($data['end_date'])->format('m/d/Y H:i A');
                })
                ->addColumn('is_current', function(Week $data) {
                    return $data->is_current ? '<img class="active-image" src="'.asset('assets/images/check.png').'" />' : '';
                })
                ->addColumn('action', function(Week $data) {
                    $delete ='<a href="javascript:;" data-href="' . route('admin-week-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                    return '<div class="action-list"><a data-href="' . route('admin-week-edit',$data->id) . '" class="edit" data-toggle="modal" data-target="#modal1"> <i class="fas fa-edit"></i>Edit</a>'.$delete.'</div>';
                })
                ->rawColumns(['action', 'is_current'])
                ->toJson(); //--- Returning Json Data To Client Side
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'start_date'      => 'required|date',
            'end_date'      => 'required|date|after:start_date',
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Week();
        $input = $request->all();

        if (array_key_exists('is_current', $input)){
            Week::where(['is_current' => 1])->update(['is_current' => 0]);
        }

        $data->fill($input)->save();
        //--- Logic Section Ends
        //--- Redirect Section        
        $msg = 'New Week Added Successfully.';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Week::findOrFail($id);  
        $data['start_date'] = date("Y-m-d\TH:i:s", strtotime($data['start_date']));
        $data['end_date'] = date("Y-m-d\TH:i:s", strtotime($data['end_date']));
        return view('admin.week.edit',compact('data'));
    }
    
    //*** POST Request
    public function update(Request $request,$id) {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'start_date'      => 'required|date',
            'end_date'      => 'required|date|after:start_date'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        $data = Week::find($id);
        $input = $request->all();
        if (!array_key_exists('is_current', $input))
            $input['is_current'] = 0;
        $data->update($input);
        $msg = 'Data Updated Successfully.';
        //reset other week's current column
        Week::where('id', '<>', $data->id)->update(['is_current' => 0]);
        return response()->json($msg);
    }

     //*** GET Request Delete
     public function destroy($id)
     {
         $data = Week::find($id);
         $data->delete();
         //--- Redirect Section     
         $msg = 'Data Deleted Successfully.';
         return response()->json($msg);      
         //--- Redirect Section Ends    
     }
}
