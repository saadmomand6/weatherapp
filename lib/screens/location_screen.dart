import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/services/weather_service.dart';
import 'package:weatherapp/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationweather;
  
  const LocationScreen({super.key,
  this.locationweather});
  

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather= WeatherModel();

  late String weathericon;
  late int temperature;
  late String cityname;
  late String weathermessage;

  @override
  void initState() {
    super.initState();

    // ignore: avoid_print
    updateui(widget.locationweather);
  }
  void updateui(dynamic weatherdata){
    setState((){
      if (weatherdata == null){
        temperature=0;
        weathericon= 'error';
        weathermessage='there is an issue';
        cityname='app';
        return;
      }
      double temp = weatherdata['main'] ['temp'];
      temperature = temp.toInt();
      weathermessage = weather.getMessage(temperature);
      var condition= weatherdata['weather'] [0] ['id'];
      weathericon=weather.getWeatherIcon(condition);
      cityname = weatherdata['name'];
    });
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: const AssetImage('bgweather.jpg'),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //         Colors.white.withOpacity(0.8), BlendMode.dstATop),
        //   ),
        // ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherbutton = await weather.getweatheroflocation();
                      updateui(weatherbutton);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 45,
                      color: Color.fromARGB(255, 255, 233, 32),
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                     
                     var typedname= await Navigator.push(context, MaterialPageRoute(builder: (context)=> const CityScreen()));
                     if (typedname != null) {
                      var cityweatherdata =await weather.getweatherforcity(typedname);
                       updateui(cityweatherdata);
                     }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 45,
                      color: Color.fromARGB(255, 255, 233, 32),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children:  <Widget>[
                    Text(
                      '${temperature.toString()}°',
                      style: kTempTextStyle,
                    ),
                     Text(
                      weathericon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const  EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weathermessage in $cityname",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// var country = jsonDecode(response.body) ['sys'] ['country']; weather[0].id
// var condition = jsonDecode(response.body) ['weather'] [0] ['id];
//     //ignore: avoid_print
//      print(country);
//       var cityname = jsonDecode(response.body) ['name'];
//     //ignore: avoid_print
//      print(cityname);
//     var lon = jsonDecode(response.body) ['coord'] ['lon'];
//     //ignore: avoid_print
//      print(lon);
//     var lat = jsonDecode(response.body) ['coord'] ['lat'];
//     //ignore: avoid_print
//      print(lat);
//       var deg = jsonDecode(response.body) ['wind'] ['deg'];
//     //ignore: avoid_print
//      print(deg);
//      var description = jsonDecode(response.body) ['weather'] [0] ['description'];
//     //ignore: avoid_print
//      print(description);
//      var temp = jsonDecode(response.body) ['main'] ['temp'];
//     //ignore: avoid_print
//      print(temp);
//       var humidity = jsonDecode(response.body) ['main'] ['humidity'];
//     //ignore: avoid_print
//      print(humidity);
//      var windspeed = jsonDecode(response.body) ['wind'] ['speed'];
//     //ignore: avoid_print
//      print(windspeed);