import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/widget/body_of_detail_screen.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  const DetailScreen({
    super.key,
    required this.restaurantId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<RestaurantDetailProvider>()
          .fetchRestaurantDetail(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(66, 0, 0, 0),
            child: const BackButton(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Consumer<RestaurantDetailProvider>(
            builder: (context, value, child) {
              return switch (value.resultState) {
                RestaurantDetailLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                RestaurantDetailLoadedState(data: var restaurant) =>
                  SingleChildScrollView(
                    child: BodyOfDetailScreenWidget(restaurant: restaurant),
                  ),
                RestaurantDetailErrorState(error: var message) => Center(
                    child: Text(message),
                  ),
                _ => const SizedBox(),
              };
            },
          ),
        ),
      ),
    );
  }
}
