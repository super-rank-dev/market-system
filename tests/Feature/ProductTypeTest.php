<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\ProductType;
use App\Models\Product;

class ProductTypeTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test product type list endpoint.
     *
     * @return void
     */
    public function testProductTypeList()
    {
        // Create some sample product types
        $productTypes = ProductType::factory()->count(5)->create();

        // Send a GET request to the product types endpoint
        $response = $this->get('/api/product-types');

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the response contains the correct number of product types
        $response->assertJsonCount(5);

        // Assert that the response contains the product types with the correct attributes
        foreach ($productTypes as $productType) {
            $response->assertJsonFragment([
                'id' => $productType->id,
                'name' => $productType->name,
                'tax_percentage' => number_format($productType->tax_percentage, 2, '.', ''),
            ]);
        }
    }

    /**
     * Test product type creation endpoint.
     *
     * @return void
     */
    public function testProductTypeCreation()
    {
        // Send a POST request to the product types endpoint with a sample product type payload
        $response = $this->post('/api/product-types', [
            'name' => 'Test Product Type',
            'tax_percentage' => 10,
        ]);

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the product type was created with the correct attributes
        $response->assertJson([
            'name' => 'Test Product Type',
            'tax_percentage' => 10,
        ]);

        // Assert that the product type was created in the database
        $this->assertDatabaseHas('product_types', [
            'name' => 'Test Product Type',
            'tax_percentage' => 10,
        ]);
    }

    /**
     * Test product type update endpoint.
     *
     * @return void
     */
    public function testProductTypeUpdate()
    {
        // Create a test product type
        $productType = ProductType::factory()->create();

        // Send a PUT request to the product type endpoint with a new name and tax percentage
        $response = $this->put("/api/product-types/{$productType->id}", [
            'name' => 'Updated Product Type',
            'tax_percentage' => 15,
        ]);

        // Assert that the response was successful
        $response->assertStatus(200);

        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the product type was updated with the correct attributes
        $response->assertJson([
            'name' => 'Updated Product Type',
            'tax_percentage' => 15,
        ]);

        // Assert that the product type was updated in the database
        $this->assertDatabaseHas('product_types', [
            'id' => $productType->id,
            'name' => 'Updated Product Type',
            'tax_percentage' => 15,
        ]);
    }
    
    /**
     * Test product type deletion endpoint.
     *
     * @return void
     */
    public function testProductTypeDeletion()
    {
        // Create a test product type and a product associated with it
        $productType = ProductType::factory()->create();
        $product = Product::factory()->create(['type_id' => $productType->id]);

        // Send a DELETE request to the product type endpoint
        $response = $this->delete("/api/product-types/{$productType->id}");

        // Assert that the response was successful
        $response->assertStatus(200);
        
        // Assert that the response is JSON
        $response->assertHeader('content-type', 'application/json');

        // Assert that the product type was deleted
        $this->assertNull(ProductType::find($productType->id));

        // Assert that the product associated with the product type was also deleted from the database
        $this->assertDatabaseMissing('products', ['id' => $product->id]);
    }
}