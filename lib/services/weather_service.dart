import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b48acec6711144b3b3e75649252905';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMassge = e.response?.data['error']['message'] ??
          ' oops there was an error, try later';
      throw Exception(errMassge);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error, try later");
    }
  }

  Future<List<String>> fetchCitySuggestions(String cityName) async {
    try {
      final response =
          await dio.get('$baseUrl/search.json?key=$apiKey&q=$cityName');

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map<String>((item) => item['name'].toString()).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Suggestion Error: $e');
      return [];
    }
  }
}
