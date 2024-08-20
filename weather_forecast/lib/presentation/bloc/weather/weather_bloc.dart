// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../../core/error/app_error.dart';
import '../../../core/resource/data_resources.dart';
import '../../../core/utils/geo_dialog.dart';
import '../../../data/models/param/get_weather.param.dart';
import '../../../domain/entities/weather.entity.dart';
import '../../../domain/usecases/determine_position.usecase.dart';
import '../../../domain/usecases/get_weather.usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUsecase _getWeatherUsercase;
  final DeterminePositionUsecase _determinePositionUsecase;
  WeatherBloc(
    this._getWeatherUsercase,
    this._determinePositionUsecase,
  ) : super(WeatherInitial()) {
    on<LoadWeatherData>(onLoadWeatherData);
  }

  void onLoadWeatherData(
      LoadWeatherData event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      final position = await _determinePositionUsecase(());
      final placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);
      final DataState dataState = await _getWeatherUsercase(GetWeatherParam(
        lat: position.latitude,
        lon: position.longitude,
      ));
      if (dataState is DataSuccess && dataState.data != null) {
        emit(WeatherDone(weatherEntity: dataState.data!, placemarks: placemarks));
      }
      if (dataState is DataFailed) {
        emit(WeatherError(error: dataState.error!));
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await AppDialog.errConnection(
              dataState.error?.message ?? "Something went wrong");
        });
      }
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await AppDialog.errPermission(e.toString());
      });
    }
  }
}
