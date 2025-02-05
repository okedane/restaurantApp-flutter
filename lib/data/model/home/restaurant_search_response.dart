import 'package:restaurant_app/data/model/home/restaurant.dart';

class RestaurantSearchResponse {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantSearchResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantSearchResponse(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurants: (json['restaurants'] as List)
          .map((restaurant) => Restaurant.fromJson(restaurant))
          .toList(),
    );
  }
}
