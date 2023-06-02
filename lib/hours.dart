

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

import 'package:mausam/data/hourlydata.dart';
class hours extends StatelessWidget {
  Widget hourlylist() {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(0xFF2D8EF6),borderRadius: BorderRadius.circular(7.0)
      ),

      child: Column(
        children: [
      Center(
      child: Container(color:  Color(0xFF2D8EF6),
      margin: EdgeInsets.only(top:15.0,bottom:0.0),
      child: Text('Today',style: TextStyle(
      color: Colors.white)

      ),),
      ),
      Container(

            child: SizedBox(
              height: 200.0,
              child: ListView.builder(scrollDirection: Axis.horizontal, shrinkWrap: true,itemBuilder:(context
                  ,index){
                return  Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 15.0),
                  height: 150.0,
                  width: 80.0,
                  child: hourlydetails(Hourlydata?.hourly[index].temp as int,Hourlydata!.hourly[index].dt!,Hourlydata!.hourly[index]!.weather![0]!.icon!),
                );

              }

                  ,
                  itemCount: Hourlydata!.hourly.length>24?24:Hourlydata?.hourly.length!),
            ),
          ),
        ],
      ),
    );
  }


  final hourlydata Hourlydata;
   hours( {super.key, required this.Hourlydata});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hourlylist(),
      ],
    );
  }


}
class hourlydetails extends StatelessWidget {
  int temp;
  int time;
  String icon;
String gettime( final time){
  DateTime dateTime=DateTime.fromMillisecondsSinceEpoch(time*1000);
  String x=DateFormat('jm').format(dateTime);
  return x;
}
   hourlydetails(this.temp,this.time,this.icon);

  @override
  Widget build(BuildContext context) {

    return Container(



        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Text(gettime(time)
              ,style: TextStyle(
                  color: Colors.white
              ),),
    Image.asset('assets/weather/${icon}.png',height: 25.0,width: 25.0,),Text(temp.toString()+'°',style: TextStyle(
                color: Colors.white
            ),),
          ],
        ),

    );
  }
}





