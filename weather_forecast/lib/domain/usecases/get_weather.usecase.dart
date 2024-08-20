import '../../core/resource/data_resources.dart';
import '../../core/usecase/usecase.dart';
import '../../data/models/param/get_weather.param.dart';
import '../repositories/weather.repository.dart';

class GetWeatherUsecase implements UseCase<DataState, GetWeatherParam> {
  final WeatherRepository _weatherRepository;

  GetWeatherUsecase(this._weatherRepository);

  @override
  Future<DataState> call(GetWeatherParam params) {
    return _weatherRepository.getWeather(params: params);
  }
}
