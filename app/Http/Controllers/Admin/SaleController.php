<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Carbon\Carbon;
use App\Http\Controllers\Controller;
use App\Models\Zone;
use App\Models\Agent;
use App\Models\Sale;
use App\Models\Option;
use App\Models\OptionSale;
use App\Models\Week;

use Illuminate\Support\Facades\Input;
use Validator;
use Datatables;

class SaleController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.sale.index');
    }

    public function create()
    {
        $options = Option::where('status', 1)->get();
        $zones = Zone::all();
        $agents = Agent::all();
        $weeks = Week::all();
        return view('admin.sale.create', compact('options', 'zones', 'agents', 'weeks'));
    }

    public function createAgent($zone_id)
    {
        $agents = Agent::where('zone_id', $zone_id)->get();
        return view('admin.sale.createAgent', compact('agents', 'zone_id'));
    }

    public function createOption($zone_id, $agent_id)
    {
        $data = Zone::find($zone_id);
        $options = $data->options;
        $agent = Agent::find($agent_id);
        if ($agent->exceptional_rule)
        {
            $options = $agent->options;
        }
        return view('admin.sale.createOption', compact('options'));
    }

    public function out($data)
    {
        return $data == 0 ? 'NIL' : $data;
    }

    public function datatables()
    {
        $datas = Sale::all();
        $options = Option::all();
        try{
            $data = Datatables::of($datas)
            ->addColumn('week', function(Sale $data) {
                return ($data->week) ? $data->week->name : '-';
            })
            ->addColumn('id', function(Sale $data) {
                return ($data->agent) ? $data->agent->id : '-';
            })
            ->addColumn('terminal', function(Sale $data) {
                return ($data->terminal) ? $data->terminal->id : '-';
            })
            ->addColumn('zone', function(Sale $data) {
                return ($data->zone) ? $data->zone->name : '-';
            })
            ->addColumn('agent', function(Sale $data) {
                return ($data->agent) ? $data->agent->name : '-';
            })
            ->addColumn('sales', function(Sale $data) {
                $salerow = '';
                $options = OptionSale::where('sale_id', $data->id)->get();
                foreach ($options as $option)
                {
                    $salerow .= $option->option->name . ' = ' . $this->out($option->value) . '<br/>';
                }
                return $salerow;
            })
            ->addColumn('net', function(Sale $data) {
                $salerow = '';
                $data->net = 0;
                $options = OptionSale::where('sale_id', $data->id)->get();
                foreach ($options as $option)
                {
                    $data->net += round(($option->option->commission * $option->value) / 100);
                }
                $salerow .= $this->out($data->net) . '<br/>';
                $salerow .= 'bet1 = ' . $this->out($data->bet1) . '<br/>';
                $salerow .= 'bet2 = ' . $this->out($data->bet2);
                $data->tp = $data->net + $data->bet1 + $data->bet2;
                return $salerow;
            })
            ->addColumn('bank_tf', function(Sale $data) {
                return $this->out($data->bank_tf);
            })
            ->addColumn('paid', function(Sale $data) {
                return $this->out($data->paid);
            })
            ->addColumn('loan', function(Sale $data) {
                return '<u>' . $this->out($data->agent->deduction) . '</u><br/>' . $this->out(($data->agent->loan));
            })
            ->addColumn('sp', function(Sale $data) {
                $data->sp = $data->tp - $data->bank_tf - $data->paid;
                return $this->out($data->sp);
            })
            ->addColumn('psp', function(Sale $data) {
                $data->psp = 1000;
                return $this->out($data->psp);
            })
            ->addColumn('rt_exp', function(Sale $data) {
                $data->rt_exp = $data->zone->rt_exp;
                if ($data->agent->exceptional_rule)
                    $data->rt_exp = $data->agent->rt_exp;
                return $this->out($data->rt_exp);
            })
            ->addColumn('gross', function(Sale $data) {
                if ($data->zone && $data->agent)
                {
                    $percent = $data->zone->gross_percent;
                    if ($data->agent->exceptional_rule)
                        $percent = $data->agent->gross_percent;
                    $options = OptionSale::where('sale_id', $data->id)->get();
                    $data->gross = 0;
                    foreach ($options as $option)
                    {
                        $data->gross += round(($option->value * $percent) / 100);
                    }
                    return $this->out($data->gross);
                }
                else
                    return '-';
            })
            ->addColumn('win', function(Sale $data) {
                return 'win = ' . $this->out($data->win) . '<br/>bet1 = ' . $this->out($data->betwin1) . '<br/>bet2 = ' . $this->out($data->betwin2);
            })
            ->addColumn('tsp', function(Sale $data) {
                $data->tsp = $data->win - $data->sp;
                return $this->out($data->tsp);
            })
            ->addColumn('pay_agent', function(Sale $data) {
                $agentmoney = $data->betwin1 + $data->betwin2 + $data->win + $data->rt_exp + $data->gross;
                $companymoney = $data->sp + $data->agent->deduction + $data->psp;
                return $this->out($agentmoney - $companymoney);
            })
            ->addColumn('action', function(Sale $data) {
                $delete ='<a href="javascript:;" data-href="' . route('admin-sale-delete',$data->id) . '" data-toggle="modal" data-target="#confirm-delete" class="delete"><i class="fas fa-trash-alt"></i></a>';
                return '<div class="action-list"><a href="' . route('admin-sale-edit',$data->id) . '"> <i class="fas fa-edit"></i>Edit</a>'.$delete.'</div>';
            })
            ->rawColumns(['action', 'sales', 'net', 'win', 'loan'])
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
            'terminal_id'      => 'required',
            'zone_id'      => 'required',
            'agent_id'      => 'required',
            'bet1'      => 'required|numeric',
            'bet2'      => 'required|numeric',
            'bank_tf'      => 'required|numeric',
            'paid'      => 'required|numeric',
            'win'      => 'required|numeric',
            'betwin1'      => 'required|numeric',
            'betwin2'      => 'required|numeric',
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Sale();
        $input = $request->all();
        $data->fill($input)->save();
        for ($i = 0; $i < $input['op_count']; $i ++)
        {
            $newOpSale = new OptionSale();
            $newOpSale->sale_id = $data->id;
            $newOpSale->option_id = $input['op'.$i];
            $newOpSale->value = $input['val'.$i];
            $newOpSale->save();
        }
        //--- Logic Section Ends
        //--- Redirect Section        
        $msg = 'New Report Added Successfully.'.'<a href="'.route("admin-sale-index").'">View Sale Lists</a>';
        return response()->json($msg);      
        //--- Redirect Section Ends    
    }

    //*** GET Request
    public function edit($id)
    {
        $data = Sale::find($id);
        $zones = Zone::all();
        $agents = Agent::all();
        $weeks = Week::all();

        $options = OptionSale::where('sale_id', $id)->get();
        return view('admin.sale.edit', compact('data', 'zones', 'agents', 'weeks', 'options'));
    }
    
    //*** POST Request
    public function update(Request $request, $id) {
        $data = Sale::find($id);
        $data->options()->detach();
        $data->delete();
        //--- Validation Section
        $rules = [
            'terminal_id'      => 'required',
            'zone_id'      => 'required',
            'agent_id'      => 'required',
            'bet1'      => 'required|numeric',
            'bet2'      => 'required|numeric',
            'bank_tf'      => 'required|numeric',
            'paid'      => 'required|numeric',
            'win'      => 'required|numeric',
            'betwin1'      => 'required|numeric',
            'betwin2'      => 'required|numeric',
        ];

        $validator = Validator::make(Input::all(), $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }
        //--- Validation Section Ends

        //--- Logic Section
        $data = new Sale();
        $data->id = $id;
        $input = $request->all();
        $data->fill($input)->save();
        for ($i = 0; $i < $input['op_count']; $i ++)
        {
            $newOpSale = new OptionSale();
            $newOpSale->sale_id = $data->id;
            $newOpSale->option_id = $input['op'.$i];
            $newOpSale->value = $input['val'.$i];
            $newOpSale->save();
        }
        //--- Logic Section Ends
        //--- Redirect Section

        $msg = 'Data Updated Successfully.'.'<a href="'.route("admin-sale-index").'">View Sale Lists</a>';
        return response()->json($msg);
    }

     //*** GET Request Delete
     public function destroy($id)
     {
         $data = Sale::find($id);
         $data->options()->detach();
         $data->delete();

         $msg = 'Data Deleted Successfully.';
         return response()->json($msg);      
     }
}
