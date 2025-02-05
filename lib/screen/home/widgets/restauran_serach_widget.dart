import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_search_provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(115, 158, 158, 158),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: (query) {
          context.read<RestaurantSearchProvider>().searchRestaurant(query);
        },
        decoration: InputDecoration(
          hintText: 'Search Restaurant',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueGrey[900],
          ),
        ),
      ),
    );
  }
}
