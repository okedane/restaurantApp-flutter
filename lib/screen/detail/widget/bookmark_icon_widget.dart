import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/detail/restaurant_detail.dart';
import 'package:restaurant_app/data/model/home/restaurant.dart';
import 'package:restaurant_app/provider/bookmark/local_database_provider.dart';
import 'package:restaurant_app/provider/detail/bookmark_icon_provider.dart';

class BookmarkIconWidget extends StatefulWidget {
  final RestaurantDetail restaurant;

  const BookmarkIconWidget({
    super.key,
    required this.restaurant,
  });

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  @override
  void initState() {
    super.initState();
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() async {
      await localDatabaseProvider.loadRestaurantValueById(widget.restaurant.id);
      final value = localDatabaseProvider.restaurant == null
          ? false
          : localDatabaseProvider.restaurant!.id == widget.restaurant.id;
      bookmarkIconProvider.isBookmarked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(66, 0, 0, 0),
        child: IconButton(
          onPressed: () async {
            final localDatabaseProvider = context.read<LocalDatabaseProvider>();
            final bookmarkIconProvider = context.read<BookmarkIconProvider>();
            final isBookmarked = bookmarkIconProvider.isBookmarked;

            if (isBookmarked) {
              await localDatabaseProvider
                  .removeRestaurantValueById(widget.restaurant.id);
            } else {
              final restaurantToSave =
                  Restaurant.fromRestaurantDetail(widget.restaurant);
              await localDatabaseProvider.saveRestaurantValue(restaurantToSave);
            }
            bookmarkIconProvider.isBookmarked = !isBookmarked;
            localDatabaseProvider.loadAllRestaurantValue();
          },
          icon: Icon(
            context.watch<BookmarkIconProvider>().isBookmarked
                ? Icons.favorite
                : Icons.favorite_border_outlined,
          ),
        ),
      ),
    );
  }
}
