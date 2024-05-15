import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/Api/fetch_weather.dart';
import 'package:weather_app/model/weather_data.dart';

class GlobalController extends GetxController{
  //create various variables
  final RxBool _isLoading=true.obs;
  final RxDouble _longitude=0.0.obs;
  final RxDouble _latitude=0.0.obs;

  //instance for them to be called

  RxBool checkLoading()=>_isLoading;
  RxDouble getLongitude()=>_longitude;
  RxDouble getLatitude()=>_latitude;

  final RxInt _currentIndex=0.obs;
  final weatherData=WeatherData().obs;

  getWeatherData(){
    return weatherData.value;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(_isLoading.isTrue){
      getLocation();
    }else{
      getIndex();
    }
  }

  getLocation() async{
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled=await Geolocator.isLocationServiceEnabled();

    if(!isServiceEnabled){
      return Future.error('Location Not Enabled');
    }

    //status of permission
    locationPermission=await Geolocator.checkPermission();
    if(locationPermission==LocationPermission.deniedForever){
      return Future.error('Location is denied Forever');
    }else if(locationPermission==LocationPermission.denied){
      //request Permission
      locationPermission=await Geolocator.requestPermission();
      if(locationPermission==LocationPermission.denied){
        return Future.error('Location permission is denied');
      }

    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
      _latitude.value=value.latitude;
      _longitude.value=value.longitude;
     // _isLoading.value=false;

      //calling our weather api
      return  FetchWeatherApi().processData(value.latitude, value.longitude).then((value) {
        weatherData.value=value;
        _isLoading.value=false;
      });

    });

  }
  RxInt getIndex(){
    return _currentIndex;
  }

}