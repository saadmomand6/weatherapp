import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  
  String? cityname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child:  TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    icon: Icon(Icons.location_city,
                    color: Colors.yellow,),
                    hintText: 'Enter the City Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none),
                  ),
                  onChanged: (value) {
                    cityname= value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityname);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Icon(Icons.location_on_sharp,
              color: Color.fromARGB(255, 255, 231, 14),
              size: 150,),
            ],
          ),
        ),
      ),
    );
  }
}