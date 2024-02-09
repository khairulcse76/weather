import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LocationActivity extends StatefulWidget {
  const LocationActivity({super.key});

  @override
  State<LocationActivity> createState() => _LocationActivityState();
}

class _LocationActivityState extends State<LocationActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('Location'),
      ),
    );
  }
}
