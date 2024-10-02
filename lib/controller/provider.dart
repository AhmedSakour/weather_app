import 'package:flutter/cupertino.dart';

import '../model/weather_model.dart';

class ProviderWeather extends ChangeNotifier {
  Weather? _weatherdata;
  String? cityName;
  set weatherData(Weather? weather) {
    _weatherdata = weather;
    notifyListeners();
  }

  Weather? get weatherData => _weatherdata;
}
