import 'package:flutter/material.dart';
import 'package:weather/Activity/home_activity.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../HelperClass/json_file_data.dart';

class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key});

  @override
  State<SplashActivity> createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  Duration splashDuration = const Duration(seconds: 4);

  @override
  void initState() {
    super.initState();

    Future.delayed(splashDuration, (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeActivity() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.blue.shade200,
            child:  const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Image.asset('images/weather.png'),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.lightBlueAccent,
                  backgroundImage: AssetImage("images/weather.png",),
                ),
                Text('Weather App', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 40),),
                SpinKitPouringHourGlass(
                  color: Colors.orangeAccent,
                  size: 200.0,
                ),
                Text('Made by: SM Khairul Islam', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),),
              ],
            )
          
          ),
        ),
      ),
    );
  }
}
