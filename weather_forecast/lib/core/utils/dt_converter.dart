import 'package:intl/intl.dart';

class DtConverter {
  static String utcToWIB(int? utc) {
    if (utc != null) {
      DateTime date =
          DateTime.fromMillisecondsSinceEpoch(utc * 1000, isUtc: true)
              .add(const Duration(hours: 7));

      String formattedDate = DateFormat('d MMMM yyyy, HH:mm').format(date);
      return formattedDate;
    }
    return "";
  }

  static String utcToHours(int? utc) {
    if (utc != null) {
      DateTime date =
          DateTime.fromMillisecondsSinceEpoch(utc * 1000, isUtc: true)
              .add(const Duration(hours: 7));

      String formattedDate = DateFormat('h a').format(date);
      return formattedDate;
    }
    return "";
  }
}
