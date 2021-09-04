import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
//3ecc769faf707f247370d93d3c6a8c00

class ApiService{
  Future<Weather> getWeather(String city) async {
    final queryParameters = {'q': city,'appid': '3ecc769faf707f247370d93d3c6a8c00', 'units': 'metric'};
    final uri = Uri.https('api.openweathermap.org','/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);

    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  }
}