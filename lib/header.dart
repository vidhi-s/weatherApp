import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mausam/data/currentdata.dart';
import 'package:mausam/fetchingeverything.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Current.dart';
class header extends StatefulWidget {
   header();

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {

  final Fetching fetching = Get.put(Fetching(), permanent: true);
  String? city;
  String date = DateFormat.yMMMd().format(DateTime.now());
  @override
  void initState() {
    getadd(fetching.getlattitude().value, fetching.getlongitude().value);
    super.initState();
  }

  getadd(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0]!;
    setState(() {
      city = place.subLocality;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(


      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(
          height: 50.0,
        ),

          Container(

            child: Row(
              children: [
                Text(
                  '$city',
                  style: TextStyle(fontSize: 18.0,color: Colors.white),
                ),
                Icon(Icons.location_on,color: Colors.white,)
              ],
            ),
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
alignment: Alignment.topLeft,
          ),SizedBox(
                height: 5.0,
              ),
          Container(

            child: Text(
              '$date',
              style: TextStyle(fontSize: 15.0,color: Colors.white),
            ),
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            alignment: Alignment.topLeft,

          ),SizedBox(
          height: 30.0,
          ),
    currentW(Currentdata: fetching.getweatherdata().getcurrent() ),


            ]),

      ],
    );
  }
}
