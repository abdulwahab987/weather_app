
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  String city='';
  String formattedDate = DateFormat.yMMMd().format(DateTime.now());
  final GlobalController globalController=Get.put(GlobalController(),permanent: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAddress(globalController.getLatitude().value,globalController.getLongitude().value);
  }

  getAddress(lat,lon) async{

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark place=placemarks[0];
    setState(() {
      city=place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          alignment: Alignment.topLeft,
          child: Text(city,style: TextStyle(fontSize: 35,height: 2),),
        ),
        Container(
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(formattedDate.toString(),style: TextStyle(fontSize: 14,color: Colors.grey.shade700,height: 1.5),),
        )
      ],
    );
  }
}
