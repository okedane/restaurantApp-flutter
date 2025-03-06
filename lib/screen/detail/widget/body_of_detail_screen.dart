import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/detail/restaurant_detail.dart';
import 'package:restaurant_app/screen/detail/widget/divider_widget.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({
    super.key,
    required this.restaurant,
  });

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'restaurant-image-${restaurant.id}',
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(
                    "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(restaurant.city,
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                  Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4.0),
                  Transform.translate(
                      offset: const Offset(0, 2),
                      child: Text(restaurant.rating.toString(),
                          style: Theme.of(context).textTheme.titleLarge)),
                ],
              ),
              const SizedBox(height: 5.0),
              DividerWidget(),
              Text(
                "Description",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10.0),
              Text(restaurant.description),
              DividerWidget(),
              Text(
                "Informasi Restoran",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Kategori",
                    ),
                  ),
                  Text(
                    restaurant.categories
                        .map((category) => category.name)
                        .join(", "),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Alamat"),
                  ),
                  Text(restaurant.address)
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Foods",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: restaurant.menus.foods.map((food) {
                    return Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          food.name, // Menampilkan nama makanan dari API
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Drinks",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: restaurant.menus.drinks.map((drink) {
                    return Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          drink.name, // Menampilkan nama minuman dari API
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Restauran Reviews",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ListView.builder(
                itemCount: restaurant.customerReviews.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045088/aqwqm57kunudfs2y5swr.png",
                          ),
                        ),
                        title: Text(restaurant.customerReviews[index].name),
                        subtitle: Text(restaurant.customerReviews[index].date),
                      ),
                      const SizedBox(height: 5.0),
                      Text(restaurant.customerReviews[index].review),
                      DividerWidget()
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
