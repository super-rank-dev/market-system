<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sale;
use App\Models\Product;
    
class SaleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sales = Sale::all();
        return response()->json($sales);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|integer',
            'sale_price' => 'required|numeric',
            'tax_amount' => 'required|numeric'
        ]);
        
        $sale = new Sale();
        $sale->product_id = $request->input('product_id');
        $sale->sale_price = $request->input('sale_price');
        $sale->tax_amount = $request->input('tax_amount');
        $sale->save();
        
        return $sale;
    }
}
