import 'dart:convert';

import 'package:weather_app/Api/api_key.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';

import '../utils/api_url.dart';
class FetchWeatherApi{
  WeatherData? weatherData;

  Future<WeatherData> processData(lat,lon)async{
    var response=await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString=jsonDecode(response.body);

    weatherData=await WeatherData(
        current: WeatherDataCurrent.fromJson(jsonString),
        hourly: WeatherDataHourly.fromJson(jsonString),
      daily: WeatherDataDaily.fromJson(jsonString)
    );
    return weatherData!;
  }
}
