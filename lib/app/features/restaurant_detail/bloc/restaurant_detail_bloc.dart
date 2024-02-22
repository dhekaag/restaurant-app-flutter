import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/app/data/models/restaurant_detail_model.dart';
import 'package:restaurant_app/app/data/services/restaurant_services.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  final RestaurantService restaurantService;
  final String id;
  RestaurantDetailBloc({required this.restaurantService, required this.id})
      : super(RestaurantDetailInitial()) {
    on<RestaurantDetailEvent>((event, emit) async {
      emit(RestaurantDetailLoading());
      try {
        final response = await restaurantService.getDetailOfRestaurant(id);
        emit(RestaurantDetailLoaded(response?.restaurant!));
      } catch (error) {
        log(error.toString());
        emit(RestaurantDetailError(error.toString()));
      }
    });
  }
}
