import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/app/data/models/restaurant_list_model.dart';
import 'package:restaurant_app/app/data/services/restaurant_services.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  final RestaurantService restaurantService;
  RestaurantListBloc({required this.restaurantService})
      : super(RestaurantListInitial()) {
    on<LoadRestaurantListEvent>((event, emit) async {
      emit(RestaurantListLoading());
      try {
        final response = await restaurantService.getListOfRestaurant();
        emit(RestaurantListLoaded(response!.restaurants));
      } catch (error) {
        log(error.toString());
        emit(RestaurantListError(error.toString()));
      }
    });
  }
}
