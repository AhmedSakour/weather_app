import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Either<String, Weather>> getData(String? cityName) async {
    var uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=${dotenv.env['key']}&q=$cityName=&aqi=no');
    var response = await http.get(uri);
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return right(Weather.fromjson(body));
    } else {
      return left('something went wrong');
    }
  }
}
