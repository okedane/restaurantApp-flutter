import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://restaurant-api.dicoding.dev/images/medium/14"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
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
                        child: Text(
                          "Songedammp",
                          style: Theme.of(context).textTheme.headlineLarge,
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
                  const SizedBox(height: 5.0),
                  Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
                  ),
                  Divider(
                    thickness: 1,
                    height: 20,
                  ),
                  Text(
                    "Informasi Restoran",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Kategori"),
                      ),
                      Text("Seafood")
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Alamat"),
                      ),
                      Text("Jl. Pantai Indah No. 123")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
