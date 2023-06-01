import 'dart:convert';
import 'package:mausam/data/dailydata.dart';
import 'package:mausam/data/currentdata.dart';
import 'package:mausam/data/hourlydata.dart';
import 'package:mausam/data/weatherdata.dart';
import 'package:http/http.dart' as http;

class fetchdata {
  Weatherdata? weatherdata;
  Future<Weatherdata> processdata(lat, long) async {
    var response = await http.get(Uri.parse(geturl(lat, long)));
    var jsonstring = jsonDecode(response.body);
    weatherdata = Weatherdata(currentdata.fromJson(jsonstring),
        hourlydata.fromJson(jsonstring), dailydata.fromJson(jsonstring));
    return weatherdata!;
  }
}

String geturl(var lat, var long) {
  String url;
  url =
      'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&exclude=minutely&appid=6abd90a5daf0a2eacd983513857c1915&units=metric';
  return url;
}
