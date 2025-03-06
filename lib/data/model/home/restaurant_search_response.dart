import 'package:restaurant_app/data/model/home/restaurant.dart';

class RestaurantSearchResponse {
  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  RestaurantSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantSearchResponse(
      error: json['error'],
      founded: json["founded"],
      restaurants: (json['restaurants'] as List)
          .map((restaurant) => Restaurant.fromJson(restaurant))
          .toList(),
    );
  }
}
