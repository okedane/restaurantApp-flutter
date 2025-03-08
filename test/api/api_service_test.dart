import 'dart:convert';

import 'package:restaurant_app/data/api/api_service.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/data/model/detail/restaurant_detail_response.dart';
import 'package:restaurant_app/data/model/home/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/home/restaurant_search_response.dart';


class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockClient;
  late ApiServices apiServices;

  setUp(() {
    mockClient = MockHttpClient();
    apiServices = ApiServices();
  });

  group('ApiServices', () {
    final restaurantListJson = {
      "error": false,
      "message": "success",
      "count": 2,
      "restaurants": [
        {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description": "Lorem ipsum",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2
        },
        {
          "id": "s1knt6za9kkfw1e867",
          "name": "Kafe Kita",
          "description": "Quisque rutrum",
          "pictureId": "25",
          "city": "Gorontalo",
          "rating": 4.0
        }
      ]
    };

    final restaurantDetailJson = {
      "error": false,
      "message": "success",
      "restaurant": {
        "id": "rqdv5juczeskfw1e867",
        "name": "Melting Pot",
        "description": "Lorem ipsum",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
          {"name": "Italia"},
          {"name": "Modern"}
        ],
        "menus": {
          "foods": [
            {"name": "Paket rosemary"},
            {"name": "Toastie salmon"}
          ],
          "drinks": [
            {"name": "Es krim"},
            {"name": "Sirup"}
          ]
        },
        "rating": 4.2,
        "customerReviews": [
          {
            "name": "Ahmad",
            "review": "Tidak rekomendasi untuk pelajar!",
            "date": "13 November 2019"
          }
        ]
      }
    };

    final restaurantSearchJson = {
      "error": false,
      "founded": 1,
      "restaurants": [
        {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description": "Lorem ipsum",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2
        }
      ]
    };

    test('getRestaurant returns RestaurantListResponse if successful',
        () async {
      // Arrange
      final uri = Uri.parse('https://restaurant-api.dicoding.dev/list');
      when(() => mockClient.get(uri)).thenAnswer(
          (_) async => http.Response(jsonEncode(restaurantListJson), 200));

      // Act
      final result = await apiServices.getRestaurant(client: mockClient);

      // Assert
      expect(result, isA<RestaurantListResponse>());
      expect(result.restaurants.length, 2);
      expect(result.restaurants[0].name, 'Melting Pot');
      verify(() => mockClient.get(uri)).called(1);
    });

    test('getRestaurant throws Exception if status code is not 200', () {
      // Arrange
      final uri = Uri.parse('https://restaurant-api.dicoding.dev/list');
      when(() => mockClient.get(uri))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      
      expect(
        () => apiServices.getRestaurant(client: mockClient),
        throwsException,
      );
      verify(() => mockClient.get(uri)).called(1);
    });

    test('getRestaurantDetail returns RestaurantDetailResponse if successful',
        () async {
      // Arrange
      final String id = 'rqdv5juczeskfw1e867';
      final uri = Uri.parse('https://restaurant-api.dicoding.dev/detail/$id');
      when(() => mockClient.get(uri)).thenAnswer(
          (_) async => http.Response(jsonEncode(restaurantDetailJson), 200));

      // Act
      final result =
          await apiServices.getRestaurantDetail(id, client: mockClient);

      // Assert
      expect(result, isA<RestaurantDetailResponse>());
      expect(result.restaurant.name, 'Melting Pot');
      expect(result.restaurant.categories.length, 2);
      verify(() => mockClient.get(uri)).called(1);
    });

    test('getRestaurantDetail throws Exception if status code is not 200', () {
      // Arrange
      final String id = 'invalid-id';
      final uri = Uri.parse('https://restaurant-api.dicoding.dev/detail/$id');
      when(() => mockClient.get(uri))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(
        () => apiServices.getRestaurantDetail(id, client: mockClient),
        throwsException,
      );
      verify(() => mockClient.get(uri)).called(1);
    });

    test('searchRestaurant returns RestaurantSearchResponse if successful',
        () async {
      // Arrange
      final String query = 'Melting';
      final uri =
          Uri.parse('https://restaurant-api.dicoding.dev/search?q=$query');
      when(() => mockClient.get(uri)).thenAnswer(
          (_) async => http.Response(jsonEncode(restaurantSearchJson), 200));

      // Act
      final result =
          await apiServices.searchRestaurant(query, client: mockClient);

      // Assert
      expect(result, isA<RestaurantSearchResponse>());
      expect(result.restaurants.length, 1);
      expect(result.restaurants[0].name, 'Melting Pot');
      verify(() => mockClient.get(uri)).called(1);
    });

    test('searchRestaurant throws Exception if status code is not 200', () {
      // Arrange
      final String query = 'invalid-query';
      final uri =
          Uri.parse('https://restaurant-api.dicoding.dev/search?q=$query');
      when(() => mockClient.get(uri))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // Act & Assert
      expect(
        () => apiServices.searchRestaurant(query, client: mockClient),
        throwsException,
      );
      verify(() => mockClient.get(uri)).called(1);
    });
  });
}
