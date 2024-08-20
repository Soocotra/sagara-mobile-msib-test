import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/weather.model.dart';

part 'weather_services.g.dart';

@RestApi()
abstract class WeatherServices {
  factory WeatherServices(Dio dio, {String? baseUrl}) {
    return _WeatherServices(dio, baseUrl: baseUrl ?? dotenv.env['BASE_API']);
  }

  @GET("/forecast")
  Future<HttpResponse<WeatherModel>> getWeather({
    @Query("appid") String? apiKey,
    @Query("lat") double? lat,
    @Query("lon") double? lon,
  });
}
