import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_forecast/domain/usecases/get_weather.usecase.dart';

import 'data/data_sources/weather_services.dart';
import 'data/repositories/geolocator.repository.impl.dart';
import 'data/repositories/weather.repository.impl.dart';
import 'domain/repositories/geolocator.repository.dart';
import 'domain/repositories/weather.repository.dart';
import 'domain/usecases/determine_position.usecase.dart';
import 'presentation/bloc/weather/weather_bloc.dart';

final sl = GetIt.I;

Future<void> initiateDepedencies() async {
  sl.registerSingleton<Dio>(Dio());

  //Services
  sl.registerSingleton<WeatherServices>(
    WeatherServices(sl()),
  );
  //Repository
  sl.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(sl()),
  );
  sl.registerSingleton<GeolocatorRepository>(
    GeolocatorRepositoryImpl(),
  );

  //Usecase
  sl.registerSingleton(
    GetWeatherUsecase(sl()),
  );
  sl.registerSingleton(DeterminePositionUsecase(sl()));

  //Bloc
  sl.registerLazySingleton(
    () => WeatherBloc(sl(), sl()),
  );
}
