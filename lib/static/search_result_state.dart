import 'package:restaurant_app/data/model/home/restaurant.dart';

sealed class SearchResultState {}

class SearchNoneState extends SearchResultState {}

class SearchLoadingState extends SearchResultState {}

class SearchErrorState extends SearchResultState {
  final String message;

  SearchErrorState(this.message);
}

class SearchLoadedState  extends SearchResultState {
  final List<Restaurant> restaurants;

  SearchLoadedState(this.restaurants);
}
