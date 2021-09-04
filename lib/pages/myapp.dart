import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/api_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _apiService = ApiService();

  Weather? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                      //Image.network(_response.iconUrl),
                      Text(
                        '${_response?.main.temp}°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text('${_response?.name}')
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search, child: Text('Search'))
              ],
            ),
          ),
        ));
  }

  void _search() async {

    if(_cityTextController.text.isNotEmpty){
      final reponse = await _apiService.getWeather(_cityTextController.text);
      setState(() => _response = reponse);
    }else{
      final reponse = await _apiService.getWeather('dhaka');
      setState(() => _response = reponse);
    };
  }
}
