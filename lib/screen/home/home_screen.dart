import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/widgets/restauran_card_widget.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<RestaurantListProvider>(
            builder: (context, value, child) {
              return switch (value.resultState) {
                RestaurantListLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                RestaurantListLoadedState(data: var restaurantList) =>
                  ListView.builder(
                    itemCount: restaurantList.length,
                    // shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final restaurant = restaurantList[index];
                      return RestauranCardWidget(
                        restaurant: restaurant,
                        onTap: () {},
                      );
                    },
                  ),
                RestaurantErrorState(error: var message) => Center(
                    child: Text(message),
                  ),
                _ => const SizedBox(),
              };
            },
          )),
    );
  }
}
