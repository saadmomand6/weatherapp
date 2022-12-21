import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longitude;
Future<void> getcurrentlocationandpermission() async{
  try {
    //for taking permission to get access of device location
    LocationPermission permission = await Geolocator.requestPermission();
    // ignore: avoid_print
    print(permission);
    // for location of device
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude =position.latitude;
    longitude =position.longitude;
  } catch (e) {
    // ignore: avoid_print
    print(e);
  } 
}
}
