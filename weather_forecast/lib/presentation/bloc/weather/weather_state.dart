part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {
  final WeatherEntity? weatherEntity;
  final List<Placemark>? placemarks;
  final AppError? error;

  const WeatherState({this.weatherEntity, this.error, this.placemarks});
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherDone extends WeatherState {
  const WeatherDone({super.weatherEntity, super.placemarks});
}

final class WeatherError extends WeatherState {
  const WeatherError({super.error});
}
