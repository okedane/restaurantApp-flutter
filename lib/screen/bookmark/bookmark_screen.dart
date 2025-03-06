import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/bookmark/local_database_provider.dart';
import 'package:restaurant_app/screen/home/widgets/restauran_card_widget.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<LocalDatabaseProvider>().loadAllRestaurantValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(right: 15, top: 15, left: 15, bottom: 0),
        child: Consumer<LocalDatabaseProvider>(
          builder: (context, value, child) {
            final bookmarkList = value.restaurantList ?? [];
            return switch (bookmarkList.isNotEmpty) {
              true => ListView.builder(
                  itemCount: bookmarkList.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final restaurant = bookmarkList[index];
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
              _ => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No Bookmarked"),
                    ],
                  ),
                ),
            };
          },
        ),
      )),
    );
  }
}
