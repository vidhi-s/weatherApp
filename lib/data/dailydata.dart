import 'feels_like.dart';
import 'temp.dart';
import 'weather.dart';

class dailydata{
List<Daily> daily;
dailydata( {required this.daily});

factory dailydata.fromJson(Map<String, dynamic> json) =>
dailydata(daily: List<Daily>.from(json['daily'].map((e)=>Daily.fromJson(e))));
}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;


  Temp? temp;
  FeelsLike? feelsLike;
  int? humidity;
  List<Weather>? weather;
  double? uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,

    this.temp,
    this.feelsLike,

    this.humidity,
    this.weather,

    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    dt: json['dt'] as int?,
    sunrise: json['sunrise'] as int?,
    sunset: json['sunset'] as int?,

    temp: json['temp'] == null
        ? null
        : Temp.fromJson(json['temp'] as Map<String, dynamic>),
    feelsLike: json['feels_like'] == null
        ? null
        : FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),

    humidity: json['humidity'] as int?,
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    uvi: (json['uvi'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'dt': dt,
    'sunrise': sunrise,
    'sunset': sunset,
    'temp': temp?.toJson(),
    'feels_like': feelsLike?.toJson(),

    'humidity': humidity,
    'weather': weather?.map((e) => e.toJson()).toList(),
    'uvi': uvi,
  };
}
class Temp {
  int? min;
  int? max;

  Temp({this.min, this.max});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(

    min: (json['min'] )!.round(),
    max: (json['max'] )!.round()


  );

  Map<String, dynamic> toJson() => {

    'min': min,
    'max': max,
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

