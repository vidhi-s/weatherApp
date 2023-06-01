import 'currentdata.dart';
import 'hourlydata.dart';
import 'dailydata.dart';
class Weatherdata {
  final currentdata? current;
  final hourlydata? hourly;
  final dailydata? daily;
  Weatherdata([this.current,this.hourly,this.daily]);

  currentdata getcurrent()=>current!;
  hourlydata gethourly()=>hourly!;
  dailydata getdaily()=>daily!;
}
