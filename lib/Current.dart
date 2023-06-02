import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mausam/data/currentdata.dart';
import 'package:mausam/data/weatherdata.dart';

class currentW extends StatelessWidget {
 final currentdata? Currentdata;
   currentW( {required  this.Currentdata});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("${ Currentdata?.current.temp?.toString()}°",style: TextStyle(
                    fontSize: 90.0,color: Colors.white,
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
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
          child: Row(


            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Text('Humidity',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold)),
                    Image(image: AssetImage('assets/icons/humidity.png'),color:Colors.lightBlueAccent,height: 35.0,
                    width: 35.0,),

                    Text(Currentdata!.current.humidity.toString()+'%',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                  ],
                ),
              ),Container(margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(

                  children: [Text('Windspeed',style: TextStyle(color: Colors.white70),),
                    Image(image: AssetImage('assets/icons/windspeed.png',),color: Colors.white54,height: 35.0,
                        width: 35.0),
                    Text(Currentdata!.current.windSpeed.toString()+'Km/h',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                  ],
                ),
              ),Container(margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(

                  children: [Text('UV Index',style: TextStyle(color: Colors.white70)),
                    Icon(Icons.wb_sunny_outlined,size: 35.0,color: Colors.yellow,),
                    Text(Currentdata!.current.uvi.toString(),style: TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
