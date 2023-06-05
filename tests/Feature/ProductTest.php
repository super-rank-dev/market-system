<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Product;
use App\Models\ProductType;
use App\Models\Sale;

class ProductTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test product list endpoint.
     *
     * @return void
     */
    public function testProductList()
    {
        // Create some sample products
        $productType = ProductType::factory()->create();
        $products = Product::factory()->count(5)->create(['type_id' => $productType->id]);

        // Send a GET request to the products endpoint
        $response = $this->get('/api/products');

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the response contains the correct number of products
        $response->assertJsonCount(5);

        // Assert that the response contains the products with the correct attributes
        foreach ($products as $product) {
            $response->assertJsonFragment([
                'id' => $product->id,
                'name' => $product->name,
                'price' => number_format($product->price, 2, '.', ''),
                'type_id' => $product->type_id
            ]);
        }
    }

    /**
     * Test product creation endpoint.
     *
     * @return void
     */
    public function testProductCreation()
    {
        // Create a test product type
        $productType = ProductType::factory()->create();

        // Send a POST request to the products endpoint with a sample product payload
        $response = $this->post('/api/products', [
            'name' => 'Test Product',
            'price' => 9.99,
            'type_id' => $productType->id,
        ]);

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the product was created with the correct attributes
        $response->assertJson([
            'name' => 'Test Product',
            'price' => 9.99,
            'type_id' => $productType->id,
        ]);

        // Assert that the product was created in the database
        $this->assertDatabaseHas('products', [
            'name' => 'Test Product',
            'price' => 9.99,
            'type_id' => $productType->id,
        ]);
    }

    /**
     * Test product update endpoint.
     *
     * @return void
     */
    public function testProductUpdate()
    {
        // Create a test product and product type
        $productType = ProductType::factory()->create();
        $product = Product::factory()->create(['type_id' => $productType->id]);

        // Send a PUT request to the product endpoint with a new name and price
        $response = $this->put("/api/products/{$product->id}", [
            'name' => 'Updated Product',
            'price' => 12.99,
            'type_id' => $productType->id,
        ]);

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the product was updated with the correct attributes
        $response->assertJson([
            'name' => 'Updated Product',
            'price' => 12.99,
            'type_id' => $productType->id,
        ]);

        // Assert that the product was updated in the database
        $this->assertDatabaseHas('products', [
            'id' => $product->id,
            'name' => 'Updated Product',
            'price' => 12.99,
            'type_id' => $productType->id,
        ]);
    }

    /**
     * Test product deletion endpoint.
     *
     * @return void
     */
    public function testProductDeletion()
    {
        // Create a test product
        $product = Product::factory()->create();

        // Send a DELETE request to the product endpoint
        $response = $this->delete("/api/products/{$product->id}");

        // Assert that the response was successful
        $response->assertStatus(200);
        
        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the product was deleted
        $this->assertNull(Product::find($product->id));

        // Assert that the product was deleted from the database
        $this->assertDatabaseMissing('products', ['id' => $product->id]);
    }
}