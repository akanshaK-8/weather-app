<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WeatherData extends Model
{
    use HasFactory;

    protected $fillable = ['city_id','city','latitude', 'longitude', 'temperature', 'temp_min', 'temp_max', 'humidity', 'pressure', 'weather_date', 'sunrise', 'sunset', 'visibility', 'wind', 'weather_main', 'weather_desc'];
}
