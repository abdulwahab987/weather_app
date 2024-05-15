import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/utils/custom_colors.dart';
class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent? weatherDataCurrent;
  CurrentWeatherWidget({this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          //Temprature Area
          TempratureAreaWidget(),
          SizedBox(height: 20,),
          //more details wind speed,humidity,clouds
          CurrentWeatherMoreDetailsWidget()
        ],
      ),
    );
  }

  Widget TempratureAreaWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${weatherDataCurrent!.current!.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${weatherDataCurrent!.current!.temp!.toInt()}°'
                      ,style: TextStyle(
                    color: CustomColors.textColorBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 68
                )
                ),
                TextSpan(
                    text: '${weatherDataCurrent!.current!.weather![0].description}'
                    ,style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                )
                ),
              ]
            )
        )
      ],
    );
  }

  Widget CurrentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset('assets/icons/windspeed.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset('assets/icons/clouds.png'),
            ),
            Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset('assets/icons/humidity.png'),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text('${weatherDataCurrent!.current!.windSpeed} %',
                style: TextStyle(fontSize: 12,),
              textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text('${weatherDataCurrent!.current!.clouds} %',
                style: TextStyle(fontSize: 12,),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text('${weatherDataCurrent!.current!.humidity} %',
                style: TextStyle(fontSize: 12,),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
