<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';
    // public $timestamps = false;

    protected $fillable=
    [
        'id',
        'name',
        'image',
        'is_available',
        'is_featured',
        'is_deleted',
        'created_at',
        'updated_at',
    ];
}