<?php

namespace Database\Factories;

use App\Models\Sale;
use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class SaleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Sale::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $product = Product::factory()->create();

        return [
            'product_id' => $product->id,
            'sale_price' => $this->faker->randomFloat(2, 1, 100),
            'tax_amount' => $this->faker->randomFloat(2, 0.01, 10)
        ];
    }
}