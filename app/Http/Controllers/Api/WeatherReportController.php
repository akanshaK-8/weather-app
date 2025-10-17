<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
// use App\Models\WeatherData;
use Illuminate\Support\Facades\Log;
use App\Services\WeatherService;

class WeatherReportController extends Controller
{
    protected $weatherService;

    public function __construct(WeatherService $weatherService){
        $this->weatherService = $weatherService;

    }

    public function fetchReport(Request $request){
        try{

            return $this->weatherService->getWeatherData($request);
        
        }catch(\Exception $e) {
            Log::error('Something went wrong! '.$e->getMessage());
            return response()->json(['code' => 500, 'message' => 'Internal server error'], 500);
        }

     
    }

    public function storeDataFromWeatherApi(Request $request) {
        try{

            return $this->weatherService->callWeatherApi($request);

        }catch(\Exception $e) {

            Log::error('Something went wrong! '.$e->getMessage());
            return response()->json(['code' => 500, 'message' => 'Internal server error'], 500);
            
        }
    }
}
