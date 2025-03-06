import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/home/restaurant.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/provider/home/restaurant_search_provider.dart';
import 'package:restaurant_app/screen/home/widgets/restauran_card_widget.dart';
import 'package:restaurant_app/screen/home/widgets/restauran_serach_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';
import 'package:restaurant_app/static/search_result_state.dart';
import 'package:restaurant_app/widget/error_state_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(right: 15, top: 15, left: 15, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              const SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: Consumer<RestaurantSearchProvider>(
                  builder: (context, searchPovider, child) {
                    if (searchPovider.state is SearchLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (searchPovider.state is SearchErrorState) {
                      final error = searchPovider.state as SearchErrorState;
                      return Center(child: Text(error.message));
                    } else if (searchPovider.state is SearchLoadedState) {
                      final result = searchPovider.state as SearchLoadedState;
                      return _buildSearchResult(result.restaurants);
                    } else {
                      return Consumer<RestaurantListProvider>(
                        builder: (context, value, child) {
                          return switch (value.resultState) {
                            RestaurantListLoadingState() => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            RestaurantListLoadedState(
                              data: var restaurantList
                            ) =>
                              ListView.builder(
                                itemCount: restaurantList.length,
                                physics: const ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  final restaurant = restaurantList[index];
                                  return RestauranCardWidget(
                                    restaurant: restaurant,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        NavigationRoute.detailRoute.name,
                                        arguments: restaurant.id,
                                      );
                                    },
                                  );
                                },
                              ),
                            RestaurantErrorState(error: var message) => Center(
                                child: ErrorStateWidget(message: message),
                              ),
                            _ => const SizedBox(),
                          };
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSearchResult(List<Restaurant> restaurants) {
  return ListView.builder(
    itemCount: restaurants.length,
    itemBuilder: (context, index) {
      final restaurant = restaurants[index];
      return RestauranCardWidget(
        restaurant: restaurant,
        onTap: () => Navigator.pushNamed(
          context,
          NavigationRoute.detailRoute.name,
          arguments: restaurant.id,
        ),
      );
    },
  );
}
