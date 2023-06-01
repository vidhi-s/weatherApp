import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mausam/data/currentdata.dart';
import 'package:mausam/data/weatherdata.dart';
import 'package:mausam/fetchdata.dart';

class Fetching extends GetxController {
  final RxBool loading = true.obs;
  final RxDouble lat = 0.0.obs;
  final RxDouble long = 0.0.obs;

  RxBool isloading() => loading;

  RxDouble getlattitude() => lat;

  RxDouble getlongitude() => long;

  final weatherdata = Weatherdata().obs;
  Weatherdata getweatherdata(){
    return weatherdata.value;
  }

  @override
  void onInit() {
    if (loading == true) {
      getlocation();
    }
    super.onInit();
  }

  // Future<Position>
  getlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low)
        .then((value) {
      lat.value = value.latitude;
      long.value = value.longitude;
      return fetchdata()
          .processdata(value.latitude, value.longitude)
          .then((value) {
        weatherdata.value = value;
        loading.value = false;

      });
    });
  }
}
