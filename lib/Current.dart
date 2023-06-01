import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mausam/data/currentdata.dart';
import 'package:mausam/data/weatherdata.dart';

class currentW extends StatelessWidget {
 final currentdata? Currentdata;
   currentW( {required  this.Currentdata});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text("${ Currentdata?.current.temp?.toInt()}°",style: TextStyle(
                fontSize: 90.0,color: Colors.white
              ),),
              margin: EdgeInsets.only(left: 28.0, right: 15.0),
            ),
            Container(
              child: Text("${Currentdata?.current.weather?[0].description}",style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),),margin: EdgeInsets.only(left: 15.0, right: 15.0),
            )
          ],
        ),
        SizedBox(
          width: 15.0,
        ),
        Container(
          child: Image.asset('assets/weather/${Currentdata?.current.weather?[0].icon}.png',height: 150.0 ),
        margin: EdgeInsets.only(left: 15.0),),
      ],
    );
  }
}
