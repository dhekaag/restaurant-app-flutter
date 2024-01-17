// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:restaurant_app/app/data/models/restaurant_model.dart';
import 'package:restaurant_app/app/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_app/app/restaurant_list/restaurant_list.dart';
import 'package:restaurant_app/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.RESTAURANT_LIST;

  static final routes = {
    Routes.RESTAURANT_LIST: (context) => const RestaurantListScreen(),
    Routes.RESTAURANT_DETAIL: (context) => RestaurantDetailScreen(
        restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
  };
}
