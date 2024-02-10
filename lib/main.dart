import 'package:flutter/material.dart';
import 'package:weather/Activity/home_activity.dart';
import 'package:flutter/material.dart';
import 'package:weather/Activity/splash_activity.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      routes: {
       // "/" :(context)=>  const SplashActivity(),
      },
      themeMode: ThemeMode.system,
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      //home: HomeActivity(),
      home: SplashActivity(),
    );

  }
}
