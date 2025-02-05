import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/home/restaurant.dart';
import 'package:restaurant_app/static/search_result_state.dart';

class RestaurantSearchProvider with ChangeNotifier {
  final ApiServices apiServices = ApiServices();
  SearchResultState _state = SearchNoneState();
  List<Restaurant> _restaurants = [];

  RestaurantSearchProvider(ApiServices read);

  SearchResultState get state => _state;
  List<Restaurant> get restaurants => _restaurants;
  Future<void> searchRestaurant(String query) async {
    if (query.isEmpty) {
      _state = SearchNoneState();
      _restaurants = [];
      notifyListeners();
      return;
    }

    _state = SearchLoadinngState();
    notifyListeners();

    try {
      final result = await apiServices.searchRestaurant(query);
      if (result.error || result.restaurants.isEmpty) {
        _state = SearchErrorState("Restoran tidak ditemukan");
        _restaurants = [];
      } else {
        _state = SearchLoandedState(result.restaurants);
        _restaurants = result.restaurants;
      }
    } catch (e) {
      _state = SearchErrorState("Terjadi kesalahan saat mencari restoran");
      _restaurants = [];
    }
    notifyListeners();
  }
}
