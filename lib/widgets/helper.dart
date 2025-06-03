import 'package:flutter/material.dart';

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.blue; // fallback color
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.amber;

    case "partly cloudy":
    case "cloudy":
      return Colors.grey;

    case "overcast":
      return Colors.blueGrey;

    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blueGrey;

    case "patchy rain possible":
    case "light rain":
    case "patchy light rain":
    case "moderate rain":
    case "heavy rain":
    case "torrential rain shower":
      return Colors.blue;

    case "thundery outbreaks possible":
    case "moderate or heavy rain with thunder":
    case "patchy light rain with thunder":
      return Colors.deepPurple;

    case "snow":
    case "light snow":
    case "heavy snow":
    case "patchy snow possible":
    case "blizzard":
      return Colors.indigo;

    case "sleet":
    case "freezing drizzle":
    case "light freezing rain":
      return Colors.cyan;

    case "ice pellets":
      return Colors.teal;

    default:
      return Colors.blue; // fallback color
  }
}
