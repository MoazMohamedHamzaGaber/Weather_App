import 'package:flutter/material.dart';

class WeatherModel
{
  WeatherLocationModel? location;
  WeatherForeCast? forecast;
  WeatherCurrent? current;


  WeatherModel.fromJson(dynamic json)
  {
    location=WeatherLocationModel.fromJson(json['location']);
    forecast=WeatherForeCast.fromJson(json['forecast']);
    current=WeatherCurrent.fromJson(json['current']);
  }

  String getImage() {
    if (WeatherCurrent == 'Sunny' || WeatherCurrent == 'Clear' ||  WeatherCurrent == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (

    WeatherCurrent == 'Blizzard' ||  WeatherCurrent == 'Patchy snow possible'  ||  WeatherCurrent == 'Patchy sleet possible' || WeatherCurrent == 'Patchy freezing drizzle possible' || WeatherCurrent == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (WeatherCurrent == 'Freezing fog' || WeatherCurrent == 'Fog' ||  WeatherCurrent == 'Heavy Cloud' || WeatherCurrent == 'Mist' || WeatherCurrent == 'Fog') {
      return 'assets/images/cloudy.jpg';
    } else if (WeatherCurrent == 'Patchy rain possible' ||
        WeatherCurrent == 'Heavy Rain' ||
        WeatherCurrent == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (WeatherCurrent == 'Thundery outbreaks possible' || WeatherCurrent == 'Moderate or heavy snow with thunder' || WeatherCurrent == 'Patchy light snow with thunder'|| WeatherCurrent == 'Moderate or heavy rain with thunder' || WeatherCurrent == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (WeatherCurrent == 'Sunny' || WeatherCurrent == 'Clear' ||  WeatherCurrent == 'partly cloudy') {
      return Colors.orange;
    } else if (

    WeatherCurrent == 'Blizzard' ||  WeatherCurrent == 'Patchy snow possible'  ||  WeatherCurrent == 'Patchy sleet possible' || WeatherCurrent == 'Patchy freezing drizzle possible' || WeatherCurrent == 'Blowing snow') {
      return Colors.blue;
    } else if (WeatherCurrent == 'Freezing fog' || WeatherCurrent == 'Fog' ||  WeatherCurrent == 'Heavy Cloud' || WeatherCurrent == 'Mist' || WeatherCurrent == 'Fog') {
      return Colors.blueGrey;
    } else if (WeatherCurrent == 'Patchy rain possible' ||
        WeatherCurrent == 'Heavy Rain' ||
        WeatherCurrent == 'Showers	') {
      return Colors.blue;
    } else if (WeatherCurrent == 'Thundery outbreaks possible' || WeatherCurrent == 'Moderate or heavy snow with thunder' || WeatherCurrent == 'Patchy light snow with thunder'|| WeatherCurrent == 'Moderate or heavy rain with thunder' || WeatherCurrent == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}

class WeatherLocationModel
{
  String? name;
  String? localtime;

  WeatherLocationModel({
    required this.name,
    required this.localtime,
});

  WeatherLocationModel.fromJson(dynamic json)
  {
    name=json['name'];
    localtime=json['localtime'];
  }
}

class WeatherCurrent
{
  WeatherCurrentCondition? condition;
  WeatherCurrent.fromJson(dynamic json)
  {
    condition=WeatherCurrentCondition.fromJson(json['condition']);
  }
}

class WeatherCurrentCondition
{
  String? text;
  WeatherCurrentCondition.fromJson(dynamic json)
  {
    text=json['text'];
  }
}

class WeatherForeCast
{
  List<WeatherForeCastDay>forecastday=[];
  WeatherForeCast.fromJson(dynamic json)
  {
    json['forecastday'].forEach((element)
    {
      forecastday.add(WeatherForeCastDay.fromJson(element));
    }
    );
  }
}

class WeatherForeCastDay
{
  WeatherDay? day;

  WeatherForeCastDay.fromJson(dynamic json)
  {
    day=WeatherDay.fromJson(json['day']);
  }
}
class WeatherDay
{
  double? avgtemp_c;
  double? maxtemp_c;
  double? mintemp_c;

  WeatherDay.fromJson(dynamic json)
  {
    avgtemp_c=json['avgtemp_c'];
    maxtemp_c=json['maxtemp_c'];
    mintemp_c=json['mintemp_c'];
  }


}