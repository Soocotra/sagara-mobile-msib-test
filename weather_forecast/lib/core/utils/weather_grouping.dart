import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/weather.entity.dart';

class WeatherGrouping {
  static Map<String, List<WeatherList>> groupWeatherByDate(
      List<WeatherList>? weatherList) {
    if (weatherList != null) {
      return groupBy(weatherList, (WeatherList weather) {
        DateTime date = DateTime.fromMillisecondsSinceEpoch(
            ((weather.dt ?? 0) * 1000).toInt(),
            isUtc: true);
        return DateFormat("EEEE").format(date);
      });
    }
    return {};
  }
}
