import 'rain.dart';
import 'weather.dart';
class hourlydata {
  List<Hourly> hourly;
 hourlydata( {required this.hourly});

  factory hourlydata.fromJson(Map<String, dynamic> json) =>
      hourlydata(hourly: List<Hourly>.from(json['hourly'].map((e)=>Hourly.fromJson(e))));

}

class Hourly {
  int? dt;
  int? temp;
  int? clouds;
  List<Weather>? weather;
  double? pop;
  Rain? rain;

  Hourly({
    this.dt,
    this.temp,
    this.clouds,
    this.weather,
    this.pop,
    this.rain,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
    dt: json['dt'] as int?,
    temp: (json['temp'] as num?)?.round(),
    clouds: json['clouds'] as int?,
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    pop: (json['pop'] as num?)?.toDouble(),
    rain: json['rain'] == null
        ? null
        : Rain.fromJson(json['rain'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'temp': temp,
    'clouds': clouds,
    'weather': weather?.map((e) => e.toJson()).toList(),
    'pop': pop,
    'rain': rain?.toJson(),
  };
}
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: (json['id'] as int?),
    main: (json['main'] as String?),
    description: json['description'] as String?,
    icon: json['icon'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon,
  };
}
