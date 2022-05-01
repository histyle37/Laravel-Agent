<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Zone;
use App\Models\Agent;
use App\Models\Option;

use Illuminate\Support\Facades\Input;
use Validator;
use Datatables;

class AgentController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.agent.index');
    }

    public function create()
    {
        $options = Option::where('status', 1)->get();
        $zones = Zone::all();
        return view('admin.agent.create', compact('options', 'zones'));
    }

    public function datatables()
    {
        $datas = Agent::all();
        try{
            $data = Datatables::of($datas)
            ->addColumn('exceptional_rule', function(Agent $data) {
                return ($data->exceptional_rule) ? '<img class="active-image" src="'.asset('assets/images/check.png').'" />' : '';
            })
            ->addColumn('loan', function(Agent $data) {
                return ($data->loan) ? $data->loan : '-';
            })
            ->addColumn('deduction', function(Agent $data) {
                return ($data->deduction) ? $data->deduction : '-';
            })
            ->addColumn('rt_exp', function(Agent $data) {
                return ($data->exceptional_rule) ? $data->rt_exp : '-';
            })
            ->addColumn('gross_percent', function(Agent $data) {
                return ($data->exceptional_rule) ? $data->gross_percent : '-';
            })
            ->addColumn('zone', function(Agent $data) {
                if ($data->zone)
                    return $data->zone->name;
                else return "-";
            })
            ->addColumn('options', function(Agent $data) {
                return '40a';
            })
            ->addColumn('action', function(Agent $data) {
                $delete ='<a href="javascript:;" data-href="' . route('admin-agent-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                return '<div class="action-list"><a href="' . route('admin-agent-edit',$data->id) . '"> <i class="fas fa-edit"></i>Edit</a>'.$delete.'</div>';
            })
            ->rawColumns(['action', 'exceptional_rule'])
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
            'user_id'      => 'required',
            'password'      => 'required',
            'phone_number'      => 'required',
            'address'      => 'required',
            'loan'      => 'required|numeric',
            'deduction'      => 'required|numeric',
            'zone_id'      => 'required|numeric'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Agent();
        $input = $request->all();
        $input['rt_exp'] || $input['rt_exp'] = 0;

        // if ($input['rt_exp'])
        $data->fill($input)->save();

        if (array_key_exists('option', $input)){
            $data->options()->attach($input['option']);
        }
        //--- Logic Section Ends
        //--- Redirect Section        
        $msg = 'New Agent Added Successfully.'.'<a href="'.route("admin-agent-index").'">View Agent Lists</a>';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Agent::findOrFail($id);  
        $zones = Zone::all();
        $options = Option::where('status', 1)->get();
        return view('admin.agent.edit',compact('data', 'options', 'zones'));
    }
    
    //*** POST Request
    public function update(Request $request,$id) {
        //--- Validation Section
        $rules = [
            'name'      => 'required',
            'user_id'      => 'required',
            'password'      => 'required',
            'phone_number'      => 'required',
            'address'      => 'required',
            'zone_id'      => 'required|numeric'
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        $data = Agent::find($id);
        $input = $request->all();

        if (!array_key_exists('gross_percent', $input)) $input['gross_percent'] = 0;
        if (!array_key_exists('exceptional_rule', $input)) $input['exceptional_rule'] = 0;

        $data->update($input);

        $data->options()->detach();
        if (array_key_exists('option', $input)){
            $data->options()->attach($input['option']);
        }

        $msg = 'Data Updated Successfully.'.'<a href="'.route("admin-agent-index").'">View Agent Lists</a>';
        return response()->json($msg);
    }

     //*** GET Request Delete
     public function destroy($id)
     {
         $data = Agent::find($id);
         $data->options()->detach();
         $data->delete();

         $msg = 'Data Deleted Successfully.';
         return response()->json($msg);      
     }
}
