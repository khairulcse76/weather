import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherJsonAPIData {
  WeatherJsonAPIData(
      {this.location = 'Dhaka',
        this.main,
      this.description,
      this.temp,
      this.humidity,
      this.speed,
      this.icon,
      });

  String location;
  String? main;
  String? description;
  String? temp;
  String? humidity;
  String? speed;
  String? icon;

  //try{
  Future<void> getData() async {
    try{
      Uri uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3f36895fc75d0d6818780433dd7de9b0");
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);

      // Get Weather Information
      List weatherDataList = data["weather"];
      Map weatherMap = weatherDataList[0];
      String getMain = weatherMap['main'];
      String getDescription = weatherMap['description'];
      String getIcon = weatherMap['icon'];

      // Get Temp Information
      Map mainMap = data['main'];
      String getTemp = (mainMap['temp']- 273.15).toString();
      String getHumidity = mainMap['humidity'].toString();

      // Get Speed of Weather

      Map windMap = data['wind'];
      String getAirSpeed = (windMap['speed']*18/5).toString();

      // Data Initialization
      temp = getTemp;
      humidity = getHumidity;
      speed = getAirSpeed;
      main = getMain;
      description = getDescription;
      icon = getIcon;
    }catch(e){
      temp = "Error Occurs!! Check your City Name";
      humidity = "Error Occurs!! Check your City Name";
      speed = "Error Occurs!! Check your City Name";
      main = "Error Occurs!! Check your City Name";
      description = "Error Occurs!! Check your City Name";
      icon = "Error Occurs!! Icon Not Found";
    }
  }
  //}catch(){

  //}

}
