<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('weather_data', function (Blueprint $table) {
            $table->id();
            $table->string('city_id');
            $table->string('city');
            $table->decimal('latitude',10,7);
            $table->decimal('longitude',10,7);
            $table->decimal('temperature',5,2);
            $table->decimal('temp_min',5,2);
            $table->decimal('temp_max',5,2);
            $table->integer('humidity');
            $table->integer('pressure');
            $table->date('weather_date');
            $table->time('sunrise');
            $table->time('sunset');
            $table->integer('visibility');
            $table->decimal('wind',5,2);
            $table->string('weather_main');
            $table->string('weather_desc');
            $table->timestamps();

            $table->index(['city','weather_date']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('weather_data');
    }
};
