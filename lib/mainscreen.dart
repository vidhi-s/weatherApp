import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mausam/data/bycity.dart';
import 'Daily.dart';
import 'fetchingeverything.dart';
import 'package:mausam/header.dart';
import 'package:mausam/hours.dart';


class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  final Fetching fetching = Get.put(Fetching(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF5b7ede),
      body: SafeArea(

        child: Obx(() => fetching.isloading().isTrue
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blue,
              ))
            :

                 SizedBox.expand(

                  child: ListView(

                      scrollDirection: Axis.vertical,
shrinkWrap: true,
                      children: <Widget>[

                         header(),
                        hours(Hourlydata: fetching.getweatherdata().gethourly()),
                        Daily(Dailydata: fetching.getweatherdata().getdaily()),
                      ],
                    ),
                ),
              ),
            ),

    );
  }
}
