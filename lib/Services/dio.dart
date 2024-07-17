import 'package:dio/dio.dart';

import '../model/weather_model2.dart';

class WeatherDio {
  final dio = Dio();
  Future<Weather> gethttp({required String loc}) async {
    final dio = Dio();
    final response = await dio
        .get('http://api.weatherapi.com/v1/forecast.json?', queryParameters: {
      'key': '794c0dd32c244d23ad391146241107',
      'q': loc,
      'days': 4,
      'aqi': 'no',
      'alerts': 'no'
    });
    Weather weather = Weather.fromJson(response.data);
    print(weather.location.country);
    print(weather.current.tempC);
    return weather;
  }
}
