import 'package:restaurant_app/data/model/home/restaurant.dart';

sealed class SearchResultState {}

class SearchNoneState extends SearchResultState {}

class SearchLoadinngState extends SearchResultState {}

class SearchErrorState extends SearchResultState {
  final String meesage;

  SearchErrorState(this.meesage);
}

class SearchLoandedState extends SearchResultState {
  final List<Restaurant> restaurants;

  SearchLoandedState(this.restaurants);
}
