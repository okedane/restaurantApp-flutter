import 'package:restaurant_app/data/model/restaurant.dart';

sealed class RestaurantListResultState {}

class RestaurantListNoneState extends RestaurantListResultState {}

class RestaurantListLoadingState extends RestaurantListResultState {}

class RestaurantErrorState extends RestaurantListResultState {
  final String error;

  RestaurantErrorState(this.error);
}

class RestaurantListLoadedState extends RestaurantListResultState {
  final List<Restaurant> data;

  RestaurantListLoadedState(this.data);
}
