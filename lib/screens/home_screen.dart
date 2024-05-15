import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_data_widget.dart';

import '../widgets/weather_data_forecast.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController=Get.put(GlobalController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>globalController.checkLoading().isTrue ?
        Center(
          child: Image.asset('assets/icons/clouds.png',height: 50,width: 50,),
        ) :
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 20,),
            HeaderWidget(),

            //for our current temp
            CurrentWeatherWidget(
              weatherDataCurrent: globalController.weatherData().getCurrentWeather(),
            ),
            SizedBox(height: 20,),
            HourlyDataWidget(
              weatherDataHourly: globalController.weatherData().getHourlyWeather(),
            ),
            WeatherDataForecast(
              weatherDataDaily: globalController.weatherData().getDailyWeather(),
            ),
            Container(
              color: CustomColors.dividerLine,
              height: 1,
            ),
            SizedBox(height: 10,),
            ComfortLevel(weatherDataCurrent: globalController.weatherData().getCurrentWeather(),)
          ],
        )
        ),
      ),
    );
  }
}
