part of 'restaurant_detail_bloc.dart';

@immutable
sealed class RestaurantDetailState {}

final class RestaurantDetailInitial extends RestaurantDetailState {}

final class RestaurantDetailLoading extends RestaurantDetailState {}

final class RestaurantDetailLoaded extends RestaurantDetailState {
  final RestaurantDetailModel? restaurant;
  RestaurantDetailLoaded(this.restaurant);
}

final class RestaurantDetailError extends RestaurantDetailState {
  final String error;
  RestaurantDetailError(this.error);
}

