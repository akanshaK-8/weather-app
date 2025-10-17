# 🌦️ Laravel Weather Data API

This Laravel application integrates with the [OpenWeather API](https://openweathermap.org/api) to fetch, store, and retrieve weather information for a given city. This application performs following tasks: 

- Fetch data from open weather api based on city name and store data in MySQL db.
- Filter data from db based on city name or date range.



---

## 🧰 Tech Stack

- **IDE:** VS Code
- **Framework:** Laravel 10x  
- **Language:** PHP 8.1  
- **Database:** MySQL  
- **Local web server environment:** Xampp, Apache
- **HTTP Client:** Laravel `Http` Facade  
- **External API:** [OpenWeather Current Weather Data API](https://openweathermap.org/current)

---

## ⚙️ Features

✅ Fetch real-time weather data for any city and store in DB\
✅ Prevent duplicate records using `(city_id, weather_date)`  
✅ Retrieve stored data with filters (city or date range)  
✅ Handle API and DB errors gracefully  
✅ Follow standard coding practices

---

## 🧱 Project Setup

### 1️⃣ Clone the Repository in VS Code

 Run in terminal:
- `git clone https://github.com/akanshaK-8/weather-app.git`
- `cd weather-app`

### 2️⃣ Install Dependecies

- run command `composer install`

### 3️⃣ Generate application key

- `php artisan key:generate`

## 🧱 Database Setup

This project includes a pre-built MySQL database dump (`weather_app.sql`) in the `database/` folder.

### 1️⃣ Import Database
1. Open XAMPP and start **Apache** and **MySQL**.
2. Open **phpMyAdmin** at `http://localhost/phpmyadmin`.
3. Create a new database named `weather_app`.
4. Click **Import** → choose `database/weather_app.sql` → click **Go**.

### 2️⃣ Configure `.env`
- Copy `.env.example` to `.env` and update DB credentials if needed.
- example:
```DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=weather_app
DB_USERNAME=root
DB_PASSWORD=
```

## 🧱 Configure OpenWeather API Key 

### 1️⃣ Sign Up / Get API Key
- Go to https://openweathermap.org/api and sign up or log in to your account.
- Navigate to the API keys section and generate a new API key.
- Add your API key like this in .env file : `OPEN_WEATHER_API_KEY=your_openweather_api_key_here`

## 2️⃣ How to Run
- Start the local server: `php artisan serve`
- App will be running at localhost

## Sample Curl

### 1️⃣ Getting weather data based on city name from OpenWeather Api.
`curl --location 'http://127.0.0.1:8000/api/weather-data/fetch?city=london'`\
response: 
```
{
    "code": 200,
    "message": "Data saved in DB"
}

```

### 2️⃣ Fetch weather data from db based on:
- city name: `curl --location 'http://127.0.0.1:8000/api/weather-data?city=london'`\
response:
```
{
    "code": 200,
    "data": {
        "current_page": 1,
        "data": [
            {
                "city": "London",
                "date": "2025-10-17",
                "temperature": "13.84",
                "min_temperature": "12.95",
                "max_temperature": "14.44",
                "humidity": 80,
                "pressure": 1026,
                "sunrise": "11:56:03",
                "sunset": "22:35:42",
                "wind": "4.12",
                "weather": "Clouds"
            },
            {
                "city": "London",
                "date": "2025-10-18",
                "temperature": "12.95",
                "min_temperature": "12.25",
                "max_temperature": "13.33",
                "humidity": 72,
                "pressure": 1026,
                "sunrise": "11:57:46",
                "sunset": "22:33:34",
                "wind": "3.60",
                "weather": "Clouds"
            }
        ],
        "first_page_url": "http://127.0.0.1:8000/api/weather-data?page=1",
        "from": 1,
        "last_page": 1,
        "last_page_url": "http://127.0.0.1:8000/api/weather-data?page=1",
        "links": [
            {
                "url": null,
                "label": "&laquo; Previous",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=1",
                "label": "1",
                "active": true
            },
            {
                "url": null,
                "label": "Next &raquo;",
                "active": false
            }
        ],
        "next_page_url": null,
        "path": "http://127.0.0.1:8000/api/weather-data",
        "per_page": 10,
        "prev_page_url": null,
        "to": 2,
        "total": 2
    }
}
```
- date range: `curl --location 'http://127.0.0.1:8000/api/weather-data?start_date=2025-10-15&end_date=2025-10-17'`
response: 
```
{
    "code": 200,
    "data": {
        "current_page": 2,
        "data": [
            {
                "city": "London",
                "date": "2025-10-17",
                "temperature": "13.84",
                "min_temperature": "12.95",
                "max_temperature": "14.44",
                "humidity": 80,
                "pressure": 1026,
                "sunrise": "11:56:03",
                "sunset": "22:35:42",
                "wind": "4.12",
                "weather": "Clouds"
            },
            {
                "city": "Arkansas",
                "date": "2025-10-17",
                "temperature": "27.87",
                "min_temperature": "26.40",
                "max_temperature": "29.49",
                "humidity": 48,
                "pressure": 1014,
                "sunrise": "17:46:33",
                "sunset": "05:04:05",
                "wind": "0.89",
                "weather": "Clear"
            }
        ],
        "first_page_url": "http://127.0.0.1:8000/api/weather-data?page=1",
        "from": 3,
        "last_page": 6,
        "last_page_url": "http://127.0.0.1:8000/api/weather-data?page=6",
        "links": [
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=1",
                "label": "&laquo; Previous",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=1",
                "label": "1",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=2",
                "label": "2",
                "active": true
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=3",
                "label": "3",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=4",
                "label": "4",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=5",
                "label": "5",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=6",
                "label": "6",
                "active": false
            },
            {
                "url": "http://127.0.0.1:8000/api/weather-data?page=3",
                "label": "Next &raquo;",
                "active": false
            }
        ],
        "next_page_url": "http://127.0.0.1:8000/api/weather-data?page=3",
        "path": "http://127.0.0.1:8000/api/weather-data",
        "per_page": 2,
        "prev_page_url": "http://127.0.0.1:8000/api/weather-data?page=1",
        "to": 4,
        "total": 11
    }
}
```