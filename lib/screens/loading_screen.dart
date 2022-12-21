import 'package:flutter/material.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/services/weather_service.dart';


class LoadingScreen extends StatefulWidget {

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //whenever the statfull widget is created the init method is called automatically but initmethod is called once.
  //the buildmethod is also called when statful widget is created but the buildmethod is again called when we use 
  //like a setstate method so buildmethod can be called multiple times
  @override
  void initState() {
    super.initState();
    getLocationandData();    
  }  

  void getLocationandData() async {
       
       
       var weatherdata = await WeatherModel().getweatheroflocation();
       
     if (!mounted) return;
     Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  LocationScreen(locationweather: weatherdata,);
     }));
  } 



  @override
  Widget build(BuildContext context) {    
    return const Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.red,
          size: 50,
        ),
      ),
      
    );
  }
}