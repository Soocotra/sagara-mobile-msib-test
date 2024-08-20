import '../../core/resource/data_resources.dart';
import '../../data/models/param/get_weather.param.dart';
import '../../data/models/weather.model.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherModel>> getWeather({GetWeatherParam params});
}
