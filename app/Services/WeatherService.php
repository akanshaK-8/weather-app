<?php

namespace App\Services;

use App\Models\WeatherData;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;

class WeatherService {

    public function getWeatherData($request){

        $city = $request->query('city');
        $startDate = $request->query('start_date');
        $endDate = $request->query('end_date');
        $perPage = request()->get('per_page', 10);
        
        $columns = [
            'city',
            'weather_date as date',
            'temperature',
            'temp_min as min_temperature',
            'temp_max as max_temperature',
            'humidity',
            'pressure',
            'sunrise',
            'sunset',
            'wind',
            'weather_main as weather'
        ];

        if($city && ($startDate || $endDate))
            {
                Log::error('Invalid request param');
                return response()->json([
                    'code' => 400, 
                    'message' => 'Either provide city or date range(both start date and end date), not both',
                ],400);
            }

        if(!$city && !$startDate && !$endDate){
            Log::error('No paramenters found!');
            return response()->json([
               'code' => 400,
               'message' => 'Either provide city or date range(both start_date and end_date)' 
            ]);
        }

        if(!$city && (!$startDate || !$endDate))
            {
                Log::error('Date range not provided');
                return response()->json([
                    'code' => 400, 
                    'message' => 'Provide start date and end date both if datewise data needed',
                ],400);
            }

        $query = WeatherData::select($columns);

        try {
            if($city){
                $query->where('city',$city);
            }else{
                $query->whereBetween('weather_date',[$startDate,$endDate]);
            }
            $data = $query->paginate($perPage);

                        if($data->isEmpty()){
                return response()->json([
                    'code' => 404,
                    'message' => 'Data not found'
                ],404);
            }
            return response()->json([
                'code' => 200,
                'data' => $data
            ],200);

        } catch(\Exception $e){

            Log::error('Error while fetching weather data', ['error' => $e->getMessage()]);
            
            return response()->json([
                'code' => 500,
                'message' => 'Internal server error! error while fetching data from db'
            ], 500);
        }
    }

    public function callWeatherApi($request) {
        $appId = config('services.weather.appId');
        $cityQueryParam = $request->query('city'); 

        if(!$cityQueryParam){

            Log::error('City not provided!');
            return response()->json([
                'code' => 400,
                'message' => 'City not provided'
            ],400);
        
        }
 

        try{
            $response = Http::get('https://api.openweathermap.org/data/2.5/weather',[
                'q' => $cityQueryParam,
                'units' => 'metric',
                'appid' => $appId
            ]);
    
        }catch(\Exception $e){
            Log::error('Error:' . $e->getMessage());
            return response()->json(['code' => 500,'message' => 'Internal server error'], 500);
        }

        if($response->getStatusCode() !== 200){
            Log::error('Error: Some error occured in api response');
            return response()->json(['code' => $response->getStatusCode(),'message' => $response->getReasonPhrase()],);
        }

        $resJsonData = $response->json();
        
        $timing = $resJsonData['sys'] ?? [];
        $coord  = $resJsonData['coord'] ?? []; 
        $main   = $resJsonData['main'] ?? [];
        $wind   = $resJsonData['wind'] ?? [];
        $weather = $resJsonData['weather'][0] ?? [];

        $weatherDate = $this->dateModified($resJsonData['dt'],'date');
        $sunrise = $this->dateModified($timing['sunrise'],'datetime');
        $sunset = $this->dateModified($timing['sunset'],'datetime');

        $data = [
            'sunset' => $sunset,
            'sunrise' => $sunrise,
            'city' => $resJsonData['name'],
            'weather_date' => $weatherDate,
            'city_id' => $resJsonData['id'],
            'wind' => $wind['speed'] ?? 0.0,
            'weather_main' => $weather['main'],
            'latitude' => $coord['lat'] ?? 0.0,
            'longitude' => $coord['lon'] ?? 0.0,
            'temperature' => $main['temp'] ?? 0.0,
            'temp_min' => $main['temp_min'] ?? 0.0,
            'temp_max' => $main['temp_max'] ?? 0.0,
            'humidity' => $main['humidity'] ?? 0.0,
            'pressure' => $main['pressure'] ?? 0.0,
            'weather_desc' => $weather['description'],
            'visibility' => $resJsonData['visibility'] ?? 0,
        ];

       
        try {
            $dataExists = WeatherData::where('city_id',$resJsonData['id'])
                                       ->where('weather_date',$weatherDate)
                                       ->exists();
            if(!$dataExists){
                WeatherData::create($data);
                return response()->json(['code' => 200,'message' => 'Data saved in DB'], 200);
            }
            Log::debug('Duplicate data found in db for given city: ' . $cityQueryParam);
            return response()->json(['code' => 409,'message' => 'Record already exists for this city and date'],409);

        }catch(\Exception $e){
            Log::error('Error:' . $e->getMessage());
            return response()->json(['code' => 500,'message' => 'Internal server error'], 500);
        }
    }

    private function dateModified($timeStamp,$type){
        if($type === 'date'){
            return date('Y-m-d', $timeStamp);
        }
        return date('H:i:s', $timeStamp);
    }
}