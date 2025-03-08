import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/detail/category.dart';
import 'package:restaurant_app/data/model/detail/customer_review.dart';
import 'package:restaurant_app/data/model/detail/menu_item.dart';
import 'package:restaurant_app/data/model/detail/menus.dart';
import 'package:restaurant_app/data/model/detail/restaurant_detail.dart';
import 'package:restaurant_app/data/model/detail/restaurant_detail_response.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';


class MockApiServices extends Mock implements ApiServices {}

void main() {
  late MockApiServices mockApiServices;
  late RestaurantDetailProvider provider;

  setUp(() {
    mockApiServices = MockApiServices();
    provider = RestaurantDetailProvider(mockApiServices);
  });

  group('RestaurantDetailProvider Test', () {
    final String testId = "rqdv5juczeskfw1e867";

    test('Initial state should be RestaurantDetailNoneState', () {
      expect(provider.resultState, isA<RestaurantDetailNoneState>());
    });

    test(
        'Should change state to loading then loaded when fetchRestaurantDetail success',
        () async {
      
      final restaurant = RestaurantDetail(
          id: testId,
          name: "Melting Pot",
          description: "Lorem ipsum",
          city: "Medan",
          address: "Jln. Pandeglang no 19",
          pictureId: "14",
          categories: [Category(name: "Italia"), Category(name: "Modern")],
          menus: Menus(foods: [
            MenuItem(name: "Paket rosemary"),
            MenuItem(name: "Toastie salmon")
          ], drinks: [
            MenuItem(name: "Es krim"),
            MenuItem(name: "Sirup")
          ]),
          rating: 4.2,
          customerReviews: [
            CustomerReview(
                name: "Ahmad",
                review: "Tidak rekomendasi untuk pelajar!",
                date: "13 November 2019")
          ]);

      final restaurantDetailResponse = RestaurantDetailResponse(
        error: false,
        message: "success",
        restaurant: restaurant,
      );

      when(() => mockApiServices.getRestaurantDetail(testId))
          .thenAnswer((_) async => restaurantDetailResponse);

      
      await provider.fetchRestaurantDetail(testId);

      
      verify(() => mockApiServices.getRestaurantDetail(testId)).called(1);
      expect(provider.resultState, isA<RestaurantDetailLoadedState>());

      
      final loadedState = provider.resultState as RestaurantDetailLoadedState;
      expect(loadedState.data, equals(restaurant));
      expect(loadedState.data.id, testId);
      expect(loadedState.data.name, "Melting Pot");
    });


    test('Should change state to loading then error when exception is thrown',
        () async {
      
      when(() => mockApiServices.getRestaurantDetail(testId))
          .thenThrow(Exception('Network error'));

      
      await provider.fetchRestaurantDetail(testId);

      
      verify(() => mockApiServices.getRestaurantDetail(testId)).called(1);
      expect(provider.resultState, isA<RestaurantDetailErrorState>());

      final errorState = provider.resultState as RestaurantDetailErrorState;
      expect(errorState.error, "Exception: Network error");
    });
  });
}
