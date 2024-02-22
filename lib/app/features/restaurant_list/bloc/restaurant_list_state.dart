part of 'restaurant_list_bloc.dart';

@immutable
sealed class RestaurantListState {}

final class RestaurantListInitial extends RestaurantListState {}

final class RestaurantListLoading extends RestaurantListState {}

final class RestaurantListLoaded extends RestaurantListState {
  final List<RestaurantListModel?>? restaurants;

  RestaurantListLoaded(this.restaurants);
}

final class RestaurantListError extends RestaurantListState {
  final String error;
  RestaurantListError(this.error);
}
