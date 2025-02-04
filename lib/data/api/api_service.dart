import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/detail/restaurant_detail_response.dart';

import 'package:restaurant_app/data/model/home/restaurant_list_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurant() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restauran detail');
    }
  }
}
