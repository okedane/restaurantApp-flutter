import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/widgets/restauran_card_widget.dart';
import 'package:restaurant_app/screen/home/widgets/restauran_serach_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              const SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: Consumer<RestaurantListProvider>(
                  builder: (context, value, child) {
                    return switch (value.resultState) {
                      RestaurantListLoadingState() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      RestaurantListLoadedState(data: var restaurantList) =>
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline,
                                  size: 50, color: Colors.redAccent),
                              const SizedBox(height: 10),
                              Text(
                                "Gagal memuat data",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                message,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<RestaurantListProvider>()
                                      .fetchRestaurantList();
                                },
                                child: const Text("Coba Lagi"),
                              ),
                            ],
                          ),
                        ),
                      _ => const SizedBox(),
                    };
                  },
                ),
              )
            ],
          )),
    );
  }
}
