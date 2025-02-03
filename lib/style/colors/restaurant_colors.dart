// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum RestaurantColors {
  blue("Blue", Colors.blue),
  black("Black", Colors.black),
  white("white", Colors.white),
  SeconText("Secon Text", Color(0xFF6B7280));

  const RestaurantColors(this.name, this.color);

  final String name;
  final Color color;
}
