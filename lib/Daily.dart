import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mausam/data/dailydata.dart';

class Daily extends StatelessWidget {
  final dailydata Dailydata;
  Daily({required this.Dailydata});


  Widget dailylist() {
    String gettime(final time) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      String x = DateFormat('EEE').format(dateTime);
      return x;
    }
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(0xFF7696df),
         borderRadius: BorderRadius.circular(7.0)),
      child: Column(

        children: [

             Container(                color: Color(0xFF7696df),

               margin: EdgeInsets.only(top: 15.0, bottom: 0.0),
              child: Text('Next days', style: TextStyle(color: Colors.white)),
            ),

    Divider(color: Colors.white60,indent: 20.0,endIndent: 20.0,),
          Container(
            child: SizedBox(
              height: 380.0,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return   Container(
                      height: 23.0,
                      width: double.infinity,
                      margin: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                      Text(
                      gettime(Dailydata!.daily[index].dt!),
                      style: TextStyle(color: Colors.white),
                      ),
                      Image.asset('assets/weather/${Dailydata!.daily[index].weather![0].icon!}.png', height: 20.0, width: 20.0),
                      Text(
                      Dailydata!.daily[index]!.temp!.min!.toString() + '° / ' + Dailydata!.daily[index]!.temp!.max!.toString()+'°',
                      style: TextStyle(color: Colors.white),
                      ),
                      ],
                      ),
                    )
                    ;},
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        dailylist(),
suntime(),
        Container(
          margin: EdgeInsets.all(7.0),
          alignment: Alignment.center,
            child: Text('Rise And Shine',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 25.0)))

      ],
    );
  }

   Widget suntime() {
    String gettime(final time) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      String x = DateFormat('Hm').format(dateTime);
      return x;}
   return Container(margin: EdgeInsets.all(10.0),
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFF7696df),
           borderRadius: BorderRadius.circular(7.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [Text('Sunrise tommorow',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w300),),
                  SizedBox(

                    height: 5.0,

                  ),
                  Text(gettime(Dailydata!.daily[1].sunrise),style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600) ,)],
              ),Image(image: AssetImage('assets/icons/sun.png'),alignment: Alignment.bottomCenter
                ,height: 30.0,width: 30.0,),Column(
                children: [Text('Sunset tommorow',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(gettime(Dailydata!.daily[1].sunset),style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600))],
              )
            ],            )
        ],
      ),);


  }
}

