import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/home/restaurant.dart';
import 'package:restaurant_app/screen/home/widgets/restaurant_image_widget.dart';

class RestauranCardWidget extends StatelessWidget {
  const RestauranCardWidget({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  final Restaurant restaurant;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          RestaurantImageWidget(restaurant: restaurant),
          Container(
            height: 105,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(color: Colors.black26, width: 2),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 5.0),
                      Text(restaurant.city,
                          style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ),
                Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4.0),
                Transform.translate(
                  offset: const Offset(0, 2),
                  child: Text("4.8",
                      style: Theme.of(context).textTheme.titleLarge),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
