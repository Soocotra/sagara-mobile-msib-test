// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ForecastTheme {
  String? weather;
  ForecastTheme({
    this.weather,
  });

  Color getPrimaryColor() {
    switch (weather) {
      case "clear sky":
        return const Color(0xff9FDCA8);
      case "shower rain":
        return const Color(0xff40666A);
      case "rain":
        return const Color(0xff40666A);
      case "thunderstorm":
        return const Color(0xff615273);
      case "snow":
        return const Color(0xffA7ACC4);
      case "misty":
        return const Color(0xff91B4C6);
      default:
        return const Color(0xff5A8BAB);
    }
  }

  Color getSecondaryColor() {
    switch (weather) {
      case "clear sky":
        return const Color(0xffAED5E4);
      case "shower rain":
        return const Color(0xffC9E8E0);
      case "rain":
        return const Color(0xffC9E8E0);
      case "thunderstorm":
        return const Color(0xffC2B8FF);
      case "snow":
        return const Color(0xffE2E2E3);
      case "misty":
        return const Color(0xffCAD7DF);
      default:
        return const Color(0xffAED5E4);
    }
  }

  String getBackground() {
    switch (weather) {
      case "clear sky":
        return "assets/images/sunny_bg.png";
      case "shower rain":
        return "assets/images/rainy_bg.png";
      case "rain":
        return "assets/images/rainy_bg.png";
      case "thunderstorm":
        return "assets/images/thunderstorm_bg.png";
      case "snow":
        return "assets/images/snowy_bg.png";
      case "misty":
        return "assets/images/misty_bg.png";
      default:
        return "assets/images/cloudy_bg.png";
    }
  }
}
