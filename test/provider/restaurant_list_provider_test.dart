import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/home/restaurant.dart';
import 'package:restaurant_app/data/model/home/restaurant_list_response.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';


class MockApiServices extends Mock implements ApiServices {}

void main() {
  late MockApiServices mockApiServices;
  late RestaurantListProvider provider;

  setUp(() {
    mockApiServices = MockApiServices();
    provider = RestaurantListProvider(mockApiServices);
  });

  group('RestaurantListProvider Test', () {
    test('Initial state should be RestaurantListNoneState', () {
      expect(provider.resultState, isA<RestaurantListNoneState>());
    });

    test('Should change state to loading then loaded when fetchRestaurantList success', () async {
      
      final restaurants = [
        Restaurant(
          id: "rqdv5juczeskfw1e867",
          name: "Melting Pot",
          description: "Lorem ipsum",
          pictureId: "14",
          city: "Medan",
          rating: 4.2,
        ),
        Restaurant(
          id: "s1knt6za9kkfw1e867",
          name: "Kafe Kita",
          description: "Quisque rutrum",
          pictureId: "25",
          city: "Gorontalo",
          rating: 4.0,
        ),
      ];

      final restaurantListResponse = RestaurantListResponse(
        error: false,
        message: "success",
        count: 2,
        restaurants: restaurants,
      );

      when(() => mockApiServices.getRestaurant())
          .thenAnswer((_) async => restaurantListResponse);

      
      await provider.fetchRestaurantList();

      
      verify(() => mockApiServices.getRestaurant()).called(1);
      expect(provider.resultState, isA<RestaurantListLoadedState>());
      
      
      final loadedState = provider.resultState as RestaurantListLoadedState;
      expect(loadedState.data, equals(restaurants));  
      expect(loadedState.data.length, 2);  
    });

    test('Should change state to loading then error when API returns error', () async {
      
      final errorResponse = RestaurantListResponse(
        error: true,
        message: "Server error",
        count: 0,
        restaurants: [],
      );

      when(() => mockApiServices.getRestaurant())
          .thenAnswer((_) async => errorResponse);

      
      await provider.fetchRestaurantList();

      
      verify(() => mockApiServices.getRestaurant()).called(1);
      expect(provider.resultState, isA<RestaurantErrorState>());
      
      final errorState = provider.resultState as RestaurantErrorState;
      expect(errorState.error, "Server error");  
    });

    test('Should change state to loading then error when exception is thrown', () async {
      
      when(() => mockApiServices.getRestaurant())
          .thenThrow(Exception('Network error'));

      
      await provider.fetchRestaurantList();

      
      verify(() => mockApiServices.getRestaurant()).called(1);
      expect(provider.resultState, isA<RestaurantErrorState>());
      
      final errorState = provider.resultState as RestaurantErrorState;
      expect(errorState.error, "Exception: Network error");  
    });
  });
}