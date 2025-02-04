import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/home/restaurant.dart';

class RestaurantImageWidget extends StatelessWidget {
  const RestaurantImageWidget({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container sebagai background dan border
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),

        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.network(
            "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image,
                    size: 50, color: Colors.grey),
              );
            },
          ),
        ),
      ],
    );
  }
}
