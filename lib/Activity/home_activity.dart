import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/HelperClass/json_file_data.dart';
import 'package:weather/main.dart';
class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

 String temperature = 'loading....!!';
 String location = 'loading....!!';
 String airSpeed = 'loading....!!';
 String description = 'loading....!!';
 String mainDescription = 'loading....!!';

 

  void startGettingData() async {
    WeatherJsonAPIData instance = WeatherJsonAPIData(location: 'Dhaka');
    await instance.getData();
        setState(() {
          temperature=instance.temp!;
          location=instance.location;
          airSpeed=instance.speed!;
          description=instance.description!;
          mainDescription=instance.main!;
        });

  }

  @override
  void initState() {
    super.initState();

      startGettingData();
  }

  @override
  Widget build(BuildContext context) {
    var cityName=['Dhaka', 'Chattogram', 'Khulna', 'Sylhet', 'Rajshahi', 'Mymensingh', 'Rangpur', 'Barisal', 'Cumilla', 'Gazipur','Narayanganj'];
    final _random=Random();
    var city=cityName[_random.nextInt(cityName.length)];
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),*/
      backgroundColor:Colors.blueGrey.shade50,
      body: SafeArea(
        child: Container( //Main Container
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                colors: [
                  Color(0xFFe0c3fc),
                  Color(0xFF8ec5fc),
                ]
            ),
          ),

          child: SingleChildScrollView(
            child: Column(
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

                  child:   Row(
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          //margin: EdgeInsets.only(left:5, right: 20),
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            //padding: EdgeInsets.only(right:10),
                            child: const Icon(FontAwesomeIcons.search, color: Colors.blue,)),
                      ),
                       Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Please search $city ',
                            ),
                          )
                      ),
                    ],
                  ),
                ),SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Text('Text', style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text('Text', style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text('Text', style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Text('Text', style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
