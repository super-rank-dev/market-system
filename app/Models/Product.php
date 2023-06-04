<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'name',
        'price',
        'type_id'
    ];

    public function type()
    {
        return $this->belongsTo(ProductType::class);
    }

    public function sales()
    {
        return $this->hasMany(Sale::class);
    }
}
