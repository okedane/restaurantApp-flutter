import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

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
    return Column(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: NetworkImage(
                "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045088/aqwqm57kunudfs2y5swr.png",
              ),
              fit: BoxFit.cover,
            ),
            border: Border(
              right: BorderSide(
                color: Colors.black26,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.black26,
                width: 2,
              ),
              top: BorderSide(
                color: Colors.black26,
                width: 2,
              ),
            ),
          ),
        ),
        Container(
          height: 105,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border(
              right: BorderSide(
                color: Colors.black26,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.black26,
                width: 2,
              ),
              bottom: BorderSide(
                color: Colors.black26,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(restaurant.city,
                          style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Transform.translate(
                  offset: const Offset(0, 2), // Geser ke bawah sedikit
                  child: Text("4.8",
                      style: Theme.of(context).textTheme.titleLarge),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
