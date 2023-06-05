<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Sale;
use App\Models\Product;

class SaleTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test sale list endpoint.
     *
     * @return void
     */
    public function testSaleList()
    {
        // Create some sample sales with associated products
        $sales = Sale::factory()->count(5)->create();

        // Send a GET request to the sales endpoint
        $response = $this->get('/api/sales');

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the response contains the correct number of sales
        $response->assertJsonCount(5);

        // Assert that the response contains the sales with the correct attributes
        foreach ($sales as $sale) {
            $response->assertJsonFragment([
                'id' => $sale->id,
                'product_id' => $sale->product_id,
                'sale_price' => number_format($sale->sale_price, 2, '.', ''),
                'tax_amount' => number_format($sale->tax_amount, 2, '.', '')
            ]);
        }
    }

    /**
     * Test sale creation endpoint.
     *
     * @return void
     */
    public function testSaleCreation()
    {
        // Create a product to associate with the sale
        $product = Product::factory()->create();

        // Send a POST request to the sales endpoint with a sample sale payload
        $response = $this->post('/api/sales', [
            'product_id' => $product->id,
            'sale_price' => 100,
            'tax_amount' => 10,
        ]);

        // Assert that the response was successful
        $response->assertStatus(201);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the sale was created with the correct attributes
        $response->assertJson([
            'product_id' => $product->id,
            'sale_price' => 100,
            'tax_amount' => 10,
        ]);

        // Assert that the sale was created in the database
        $this->assertDatabaseHas('sales', [
            'product_id' => $product->id,
            'sale_price' => 100,
            'tax_amount' => 10,
        ]);
    }
}