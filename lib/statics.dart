import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Environment {
  production,
  development,
}

Environment env = Environment.development;




String baseURL = (env == Environment.development)
    ? "192.168.1.100:5000" // or 10.0.2.2:3000
    : "larva-backend.herokuapp.com";

String baseUploadsURL = (env == Environment.development)
    ? "http://192.168.1.101:5000/uploads/"
    : "https://larva-backend.herokuapp.com/";


DateFormat datetimeFormat = DateFormat("dd/MM/yyyy HH:mm");
DateFormat dateFormat = DateFormat("dd/MM/yyyy");


class Palette {
  static const Color iconColor = Color(0xffaabbcc);
  static const Color primaryColor = Color(0xff1e4cab);
  static const Color secondaryColor = Color(0xff6dc3cd);
  static const List<Color> tertiaryColors = [
    Color(0xff7fe0c6),
    Color(0xfff97e60),
    Color(0xfff9575a)
  ];

    static const List<Color> quaternaryColors = [
    Color(0xff475777),
    Color(0xff1b2c46)
  ];
  
  static const Color backgroundColor = Color(0xff1a1c28);
}

ThemeData themeLightData(BuildContext context) {
  return ThemeData(
    backgroundColor: const Color(0xffffffff),
    primaryColor: Palette.primaryColor,
    primaryColorLight: const Color(0xff000000),
  );
}

ThemeData themeDarkData(BuildContext context) {
  return ThemeData(
    backgroundColor: const Color(0xff1a1c28),
    primaryColor: Palette.primaryColor,
    primaryColorLight: const Color(0xfff7f9fb),
  );
}

String capitalize(String msg) {
  return '${msg[0].toUpperCase()}${msg.substring(1)}';
}


