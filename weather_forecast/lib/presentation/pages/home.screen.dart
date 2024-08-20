import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/enum/icons_enum.dart';
import '../../core/utils/dt_converter.dart';
import '../../core/utils/forecast_theme.dart';
import '../../core/utils/icon_lib.dart';
import '../../core/utils/weather_grouping.dart';
import '../bloc/weather/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            final theme = ForecastTheme(
                weather: state
                    .weatherEntity?.list?.first.weather?.first.description);
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(theme.getBackground()),
              )),
            );
          },
        ),
        ListView(
          padding: EdgeInsets.fromLTRB(34.w, 70.h, 34.w, 0.h),
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(35.r),
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      final theme = ForecastTheme(
                          weather: state.weatherEntity?.list?.firstOrNull
                              ?.weather?.firstOrNull?.description);
                      return Container(
                        padding: EdgeInsets.all(25.w),
                        decoration: BoxDecoration(
                            color: theme.getPrimaryColor(),
                            borderRadius: BorderRadius.circular(35.r)),
                        child: Column(
                          children: [
                            Text("Today",
                                style: Get.textTheme.headlineSmall?.copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: theme.getSecondaryColor())),
                            SizedBox(
                              height: 16.h,
                            ),
                            state is WeatherDone
                                ? (state.weatherEntity?.list?.first != null
                                    ? Image.network(
                                        "https://openweathermap.org/img/wn/${state.weatherEntity?.list?[0].weather?[0].icon}@4x.png",
                                        width: 225.w,
                                        height: 102.h,
                                        fit: BoxFit.cover,
                                      )
                                    : IconsLib(
                                        icon: AppIcons.cloud,
                                      ))
                                : IconsLib(
                                    icon: AppIcons.cloud,
                                  ),
                            Text(
                                state is WeatherDone
                                    ? "${((state.weatherEntity?.list!.first.main?.temp ?? 273.51) - 273.15).round()}°C"
                                    : "0°",
                                style: Get.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 70.sp,
                                    color: theme.getSecondaryColor())),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              state is WeatherDone
                                  ? state.weatherEntity?.list?.first.weather
                                          ?.first.main ??
                                      "----"
                                  : "----",
                              style: Get.textTheme.titleMedium?.copyWith(
                                  color: theme.getSecondaryColor(),
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              state is WeatherDone
                                  ? state.weatherEntity?.city?.name != null
                                      ? "${state.weatherEntity?.city?.name}, ${state.weatherEntity?.city?.country}"
                                      : "-------"
                                  : "-------",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                  color: theme.getSecondaryColor(),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              state.weatherEntity?.list?.first.dt != null
                                  ? DtConverter.utcToWIB(
                                      state.weatherEntity?.list?.first.dt)
                                  : "-------",
                              style: Get.textTheme.bodyMedium?.copyWith(
                                  color: theme.getSecondaryColor(),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Divider(
                              color: theme.getSecondaryColor(),
                              height: 0,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildDetails(
                                    icon: AppIcons.humidity,
                                    label: "HUMIDITY",
                                    value: state is WeatherDone
                                        ? state.weatherEntity?.list?.first.main
                                                    ?.humidity !=
                                                null
                                            ? "${state.weatherEntity?.list?.first.main?.humidity}%"
                                            : "--"
                                        : "--"),
                                _buildDetails(
                                    icon: AppIcons.wind,
                                    label: "WIND",
                                    value: state is WeatherDone
                                        ? state.weatherEntity?.list?.first.wind
                                                    ?.speed !=
                                                null
                                            ? "${state.weatherEntity?.list?.first.wind?.speed} m/sec"
                                            : "--"
                                        : "--"),
                                _buildDetails(
                                    icon: AppIcons.feelsLike,
                                    label: "FEELS LIKE",
                                    value: state is WeatherDone
                                        ? state.weatherEntity?.list?.first.main
                                                    ?.feelsLike !=
                                                null
                                            ? "${((state.weatherEntity?.list?.first.main?.feelsLike ?? 0) - 273.51).round()}°C"
                                            : "--"
                                        : "--"),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 35.h,
            ),
            _hourlyForecastBuilder()
          ],
        ),
        _draggableSheetBuilder()
      ],
    ));
  }

  ClipRRect _hourlyForecastBuilder() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(25.r)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 42, sigmaY: 42),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherError) {
              return Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  child: Text(
                    state.error?.message ?? "--------",
                    style: Get.textTheme.titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              );
            }
            return BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                final theme = ForecastTheme(
                    weather: state.weatherEntity?.list?.firstOrNull?.weather
                        ?.firstOrNull?.description);
                return Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: theme.getPrimaryColor().withOpacity(0.4),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 24.h,
                    ),
                    itemCount: (WeatherGrouping.groupWeatherByDate(
                                    state.weatherEntity?.list)
                                .values
                                .toList()
                                .firstOrNull ??
                            [])
                        .length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.weatherEntity?.list?[index].dt != null
                              ? index == 0
                                  ? "NOW"
                                  : DtConverter.utcToHours(
                                      WeatherGrouping.groupWeatherByDate(
                                              state.weatherEntity?.list)
                                          .values
                                          .first[index]
                                          .dt)
                              : "--",
                          style: Get.textTheme.titleSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          children: [
                            WeatherGrouping.groupWeatherByDate(
                                            state.weatherEntity?.list)
                                        .values
                                        .first[index]
                                        .weather
                                        ?.first
                                        .icon !=
                                    null
                                ? Image.network(
                                    "https://openweathermap.org/img/wn/${WeatherGrouping.groupWeatherByDate(state.weatherEntity?.list).values.first[index].weather?.first.icon}@4x.png",
                                    width: 56.w,
                                    height: 22.h,
                                    fit: BoxFit.cover,
                                  )
                                : IconsLib(
                                    icon: AppIcons.cloud,
                                    color: Colors.white,
                                    width: 24.w,
                                    height: 24.w,
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "${((WeatherGrouping.groupWeatherByDate(state.weatherEntity?.list).values.first[index].main?.temp ?? 273.51) - 273.51).round()}°C",
                          style: Get.textTheme.titleSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  DraggableScrollableSheet _draggableSheetBuilder() {
    return DraggableScrollableSheet(
        initialChildSize: 0.12001,
        minChildSize: 0.12,
        maxChildSize: 0.9,
        snap: true,
        builder: (context, scrollController) =>
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                final theme = ForecastTheme(
                    weather: state.weatherEntity?.list?.firstOrNull?.weather
                        ?.firstOrNull?.description);
                return Container(
                  decoration: BoxDecoration(
                      color: theme.getSecondaryColor(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r))),
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    children: [
                      Container(
                        height: 12.h,
                        margin: EdgeInsets.only(
                            top: 16.h, left: 150.w, right: 150.w),
                        decoration: BoxDecoration(
                            color: theme.getPrimaryColor(),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(16.r),
                                right: Radius.circular(16.r))),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Daily Forecast",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.titleLarge
                            ?.copyWith(color: theme.getPrimaryColor()),
                      ),
                      BlocBuilder<WeatherBloc, WeatherState>(
                        builder: (context, state) {
                          if (state is WeatherError) {
                            return const SizedBox();
                          }
                          return state.weatherEntity?.list != null
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(34.w),
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: scrollController,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                  itemCount: WeatherGrouping.groupWeatherByDate(
                                          state.weatherEntity?.list)
                                      .length,
                                  itemBuilder: (context, index) {
                                    final weatherByDay =
                                        WeatherGrouping.groupWeatherByDate(
                                            state.weatherEntity?.list);
                                    final theme = ForecastTheme(
                                        weather: state
                                            .weatherEntity
                                            ?.list
                                            ?.firstOrNull
                                            ?.weather
                                            ?.firstOrNull
                                            ?.description);
                                    return ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              color: theme
                                                  .getPrimaryColor()
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      weatherByDay.isNotEmpty
                                                          ? weatherByDay.keys
                                                              .toList()[index]
                                                          : "-----",
                                                      style: Get.textTheme
                                                          .headlineSmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      weatherByDay.isNotEmpty
                                                          ? weatherByDay.values
                                                                  .toList()[
                                                                      index]
                                                                  .first
                                                                  .weather
                                                                  ?.first
                                                                  .main ??
                                                              "---"
                                                          : "---",
                                                      style: Get
                                                          .textTheme.bodyLarge
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    SizedBox(
                                                      height: 22.h,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                          children: [
                                                            const TextSpan(
                                                                text:
                                                                    "Humidity "),
                                                            TextSpan(
                                                                text: weatherByDay
                                                                        .isNotEmpty
                                                                    ? "${weatherByDay.values.toList()[index].first.main?.humidity ?? "---"}%"
                                                                    : "---%",
                                                                style: Get
                                                                    .textTheme
                                                                    .bodyLarge
                                                                    ?.copyWith(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                          ],
                                                          style: Get.textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                          children: [
                                                            const TextSpan(
                                                                text: "Wind "),
                                                            TextSpan(
                                                                text: weatherByDay
                                                                        .isNotEmpty
                                                                    ? "${weatherByDay.values.toList()[index].first.wind?.speed ?? "---"} m/s"
                                                                    : "--- m/s",
                                                                style: Get
                                                                    .textTheme
                                                                    .bodyLarge
                                                                    ?.copyWith(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                          ],
                                                          style: Get.textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    (state.weatherEntity?.list
                                                                ?.first !=
                                                            null
                                                        ? Image.network(
                                                            "https://openweathermap.org/img/wn/${weatherByDay.values.toList()[index].first.weather?.first.icon}@4x.png",
                                                            width: 100.w,
                                                            height: 56.w,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : IconsLib(
                                                            icon:
                                                                AppIcons.cloud,
                                                          )),
                                                    SizedBox(
                                                      height: 16.h,
                                                    ),
                                                    Text(
                                                      "${((weatherByDay.values.toList()[index].first.main?.temp ?? 273.51) - 273.15).round()}°C",
                                                      style: Get.textTheme
                                                          .displaySmall
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  })
                              : const SizedBox();
                        },
                      ),
                    ],
                  ),
                );
              },
            ));
  }

  BlocBuilder _buildDetails(
      {required AppIcons icon, required String label, required String value}) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final theme = ForecastTheme(
            weather:
                state.weatherEntity?.list?.first.weather?.first.description);
        return Column(
          children: [
            IconsLib(
                icon: icon,
                width: 30.w,
                height: 30.w,
                color: theme.getSecondaryColor()),
            SizedBox(
              height: 8.h,
            ),
            Text(
              label,
              style: Get.textTheme.bodySmall?.copyWith(
                  color: theme.getSecondaryColor(),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              value,
              style: Get.textTheme.bodySmall?.copyWith(
                  color: theme.getSecondaryColor(),
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
      },
    );
  }
}
