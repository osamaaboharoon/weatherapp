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
}
