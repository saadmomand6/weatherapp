import 'package:weatherapp/services/location_service.dart';
import 'package:weatherapp/services/networking_service.dart';

const apikey = 'your api key';

class WeatherModel {
     
     Future getweatherforcity(String city) async{
      Network networkhelper = Network('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric'); 
      var weatherdetails = await networkhelper.getdata();
     return weatherdetails;
     
     }

   Future<dynamic> getweatheroflocation() async{
    Location location = Location();
    await location.getcurrentlocationandpermission();

    Network networkhelper = Network('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');    
  
     var weatherdetails = await networkhelper.getdata();
     return weatherdetails;
   }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
