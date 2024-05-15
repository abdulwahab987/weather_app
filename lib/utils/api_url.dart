import '../Api/api_key.dart';

String apiUrl(var lat,var long){
  String url;

  url='https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&appid=$apikey&units=metric&exclude=minutely';
  return url;
}