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
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: RestaurantTextStyle.displayLarge,
      displayMedium: RestaurantTextStyle.displayMedium,
      displaySmall: RestaurantTextStyle.displaySmall,
      //masuk
      headlineLarge: RestaurantTextStyle.headlineLarge,
      //masuk
      headlineMedium: RestaurantTextStyle.headlineMedium,
      headlineSmall: RestaurantTextStyle.headlineSmall,
      //masuk nama Restaurant
      titleLarge: RestaurantTextStyle.titleLarge,
      //masuk nama grey Daerah
      titleMedium: RestaurantTextStyle.titleMedium,
      //masuk nama
      titleSmall: RestaurantTextStyle.titleSmall,
      bodyLarge: RestaurantTextStyle.bodyLargeBold,
      bodyMedium: RestaurantTextStyle.bodyLargeMedium,
      bodySmall: RestaurantTextStyle.bodyLargeRegular,
      labelLarge: RestaurantTextStyle.labelLarge,
      labelMedium: RestaurantTextStyle.labelMedium,
      labelSmall: RestaurantTextStyle.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.headlineMedium,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }
}
