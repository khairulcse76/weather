import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/HelperClass/json_file_data.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather/main.dart';
class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

 String? temperature = 'loading....!!';
 String location = 'loading....!!';
 String airSpeed = '';
 String humidity = '';
 String description = 'loading....!!';
 String mainDescription = 'loading....!!';
 String weatherIcon = '01d';
 String searchCity = 'Dhaka';
 String? notFound;


 TextEditingController searchCityCtrl = TextEditingController();

  void startGettingData() async {
    WeatherJsonAPIData instance;
    if(searchCityCtrl.text !=null && searchCityCtrl.text.isNotEmpty){
      instance = WeatherJsonAPIData(location: searchCityCtrl.text);
    }else{
      instance = WeatherJsonAPIData(location: searchCity);
    }
    await instance.getData();
        setState(() {
          temperature=instance.temp!;
          location=instance.location;
          airSpeed=instance.speed!;
          description=instance.description!;
          mainDescription=instance.main!;
          weatherIcon=instance.icon!;
          humidity=instance.humidity!;
          notFound='';
          if(instance.temp=='N/A'){
            description='Loading....';
            location='Loading....';
            weatherIcon='01d';
            notFound='City Not Found';
          }


          if (kDebugMode) {
            print("WeatherIcon: $weatherIcon");
          }
        });
  }

  @override
  void initState() {
    super.initState();
    startGettingData();
  }

  @override
  Widget build(BuildContext context) {
    var cityName=['Dhaka', 'Chattogram', 'Khulna', 'Sylhet', 'Rajshahi', 'Mymensingh', 'Rangpur', 'Barisal', 'Camilla', 'Gazipur','Narayanganj'];
    final _random=Random();
    var city=cityName[_random.nextInt(cityName.length)];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blueGrey,
          //title: const Text('Dashboard'),
          //centerTitle: true,
        ),
      ),
      backgroundColor:Colors.blueGrey.shade50,
      body: SafeArea(
        child: Center(
          child: Container( //Main Container
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                  //tops: [0.1, 0.2,0.3,0.9,],
                  colors: [
                    Colors.lightBlue,
                    Colors.lightBlueAccent,
                  ]
              ),
            ),
            constraints: const BoxConstraints(
              maxWidth: 800
            ),

            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10,),
                  Container( //search box
                    padding: const EdgeInsets.symmetric(horizontal: 30, ),
                    margin: const EdgeInsets.symmetric(horizontal: 15.0,),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(30))
                    ),
                    //Search Box Row
                    child:   Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            if((searchCityCtrl.text).replaceAll(" ", "") ==""){
                              //print('Search Blank');
                            }else{
                              setState(() {
                                startGettingData();
                              });
                              searchCityCtrl.clear();
                            }
                          },
                          child: Container(
                            //margin: EdgeInsets.only(left:5, right: 20),
                            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              //padding: EdgeInsets.only(right:10),
                              child: const Icon(FontAwesomeIcons.search, color: Colors.blue,)),
                        ),
                         Expanded(
                            child: TextField(
                              controller: searchCityCtrl,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Please search City like $city ',
                              ),
                              onEditingComplete: (){
                                if((searchCityCtrl.text).replaceAll(" ", "") ==""){
                                  //print('Search Blank');
                                }else{
                                  setState(() {
                                    startGettingData();
                                    searchCityCtrl.clear();
                                  });
                                }
                              },
                            )
                        ),
                      ],
                    ),
                  ),const SizedBox(height: 10,),
                  Row( // Container 1
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.network("https://openweathermap.org/img/wn/$weatherIcon@2x.png", width: 100, height: 100, scale: 1.0,),
                                  Column(
                                    children: [
                                      notFound == '' ?
                                      Text("$description Clouds", style: const TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold))
                                     : Text('$notFound ', style: const TextStyle(color: Colors.red,fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                      Text('In $location', style: const TextStyle(color: Colors.black,fontSize: 16),textAlign: TextAlign.center,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // main Container 2 Degree 41 c
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 280,
                          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Icon(WeatherIcons.thermometer, size: 40,color: Colors.black,),
                                  ],
                                ),
                              ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(double.tryParse(temperature!)?.toStringAsFixed(2) ?? '0.0', style: TextStyle(color: Colors.black,fontSize: 80, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    SizedBox(width: 10,),
                                    Text('C', style: TextStyle(color: Colors.black,fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                  ],
                                ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Main Container 3 Air Speed
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 10,),
                                child: Row(
                                  children: [
                                    Icon(WeatherIcons.day_windy, size: 30,color: Colors.black,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20,),
                                      child: Text('Air Speed'),
                                    ),
                                  ],
                                ),
                              ),
                              Text(double.tryParse(airSpeed)?.toStringAsFixed(2) ?? '0.0', style: const TextStyle(color: Colors.black,fontSize: 40, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              const Text('Km/hr', style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                      //Container Humidity
                      Expanded(
                        child: Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 10,),
                                child: Row(
                                  children: [
                                    Icon(WeatherIcons.humidity, size: 30,color: Colors.black,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20, top: 10),
                                      child: Text('Humidity'),
                                    ),
                                  ],
                                ),
                              ),
                              Text(double.tryParse(humidity)?.toStringAsFixed(2) ?? '0.0', style: const TextStyle(color: Colors.black,fontSize: 40, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              const Text('percent', style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Made by: SMK', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Text('Data Providing by: OpenWeather.com'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
