import 'package:flutter/material.dart';
import 'package:restaurant_app/style/colors/restaurant_colors.dart';
import 'package:restaurant_app/style/typography/restaurant_text_style.dart';

class RestaurantTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        colorSchemeSeed: RestaurantColors.blue.color,
        brightness: Brightness.light,
        textTheme: _textTheme,
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFe7e7ff));
  }

  static ThemeData get drakMode {
    return ThemeData(
      colorSchemeSeed: RestaurantColors.blue.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: RestaurantTextStyle.displayLarge,
      displayMedium: RestaurantTextStyle.displayMedium,
      displaySmall: RestaurantTextStyle.displaySmall,
      headlineLarge: RestaurantTextStyle.headlineLarge,
      headlineMedium: RestaurantTextStyle.headlineMedium,
      headlineSmall: RestaurantTextStyle.headlineSmall,
      titleLarge: RestaurantTextStyle.titleLarge,
      titleMedium: RestaurantTextStyle.titleMedium,
      titleSmall: RestaurantTextStyle.titleSmall,
      bodyLarge: RestaurantTextStyle.bodyLargeBold,
      bodyMedium: RestaurantTextStyle.bodyLargeMedium,
      bodySmall: RestaurantTextStyle.bodyLargeRegular,
      labelLarge: RestaurantTextStyle.labelLarge,
      labelMedium: RestaurantTextStyle.labelMedium,
      labelSmall: RestaurantTextStyle.labelSmall,
    );
  }
}
