import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mausam/data/dailydata.dart';

class Daily extends StatelessWidget {
  final dailydata Dailydata;
  Daily({required this.Dailydata});

  Widget dailylist() {
    String gettime(final time) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      String x = DateFormat('MMM').format(dateTime);
      return x;
    }
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(0xFF58B1F6), borderRadius: BorderRadius.circular(7.0)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              color: Color(0xFF58B1F6),
              margin: EdgeInsets.only(top: 15.0, bottom: 0.0),
              child: Text('Next days', style: TextStyle(color: Colors.white)),
            ),
          ),
          Container(
            child: SizedBox(
              height: 500.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      height: 400.0,
                      width: double.infinity,
                      child:  Column(
                    children: [
                    Text(
                    gettime(Dailydata!.daily[index].dt!),
                    style: TextStyle(color: Colors.white),
                    ),
                    Image.asset('assets/weather/${Dailydata!.daily[index].weather![0].icon!}.png', height: 20.0, width: 20.0),
                    Text(
                    Dailydata!.daily[index]!.temp!.min!.toString() + '°/' + Dailydata!.daily[index]!.temp!.max!.toString(),
                    style: TextStyle(color: Colors.white),
                    ),
                    ],
                    )
                    );},
                  itemCount: Dailydata!.daily.length > 10
                      ? 10
                      : Dailydata?.daily.length!),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        dailylist(),
      ],
    );
  }
}

// Dailydata!.daily[index].dt!,
// Dailydata!.daily[index].weather![0].icon!,
// Dailydata!.daily[index]!.temp!.min!,
// Dailydata!.daily[index]!.temp!.max! as int),