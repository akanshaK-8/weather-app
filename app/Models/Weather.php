<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Weather extends Model
{
    use HasFactory;

    protected $table = 'weathers';

    protected $casts = [
        'daily' => 'object'
    ];

    protected $fillable = ['latitude','longitude','timezone','timezone_offset','daily'];
}
