import 'package:flutter/material.dart';
import 'package:restaurant_app/style/colors/restaurant_colors.dart';

class RestaurantTextStyle {
  static const TextStyle _commonStyle = TextStyle(
    fontFamily: 'Roboto',
  );

  static TextStyle displayLarge = _commonStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displayMedium = _commonStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w600,
  );

  static TextStyle displaySmall = _commonStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );

  //masuk
  static TextStyle headlineLarge = _commonStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  // masuk
  static TextStyle headlineMedium = _commonStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headlineSmall = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  //masuk nama Restauran
  static TextStyle titleLarge = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  //masuk nama daerah
  static TextStyle titleMedium = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: RestaurantColors.SeconText.color,
  );

  //masuk nama
  static TextStyle titleSmall = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyLargeBold = _commonStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: RestaurantColors.SeconText.color);

  static TextStyle bodyLargeMedium = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static TextStyle bodyLargeRegular = _commonStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
  );

  static TextStyle labelLarge = _commonStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

  static TextStyle labelMedium = _commonStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
  );

  static TextStyle labelSmall = _commonStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w100,
  );
}
