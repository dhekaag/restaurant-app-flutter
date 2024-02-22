// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/app/constant/color.dart';
import 'package:restaurant_app/app/data/models/restaurant_model.dart';
import 'package:restaurant_app/app/data/services/restaurant_services.dart';
import 'package:restaurant_app/app/features/restaurant_detail/bloc/restaurant_detail_bloc.dart';

import 'widget/restaurant_description/restaurant_description_widget.dart';
import 'widget/restaurant_menus/restaurant_menus.dart';
import 'widget/restaurant_title/restaurant_title_widget.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          RestaurantDetailBloc(id: id, restaurantService: RestaurantService()),
      child: BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
        builder: (context, state) {
          if (state is RestaurantDetailLoading) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: zBackgroundColor,
                elevation: 0,
                title: const Text("Detail Restoran",
                    style: TextStyle(color: Colors.black)),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is RestaurantDetailLoaded) {
            final restaurant = state.restaurant;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: zBackgroundColor,
                elevation: 0,
                title: Text(
                  restaurant!.name!,
                  style: const TextStyle(color: Colors.black),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Restaurant picture
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: Image.network(
                        restaurant.pictureId!,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // * Restaurant name, location and rating
                    RestaurantTitle(restaurant: restaurant),
                    Divider(
                      color: zHintColor,
                    ),

                    // * Restaurant description
                    RestaurantDescription(size: size, restaurant: restaurant,),
                    Divider(
                      color: zHintColor,
                    ),

                    // * Restaurant Menus
                    RestaurantMenus(size: size, restaurant: restaurant),
                  ],
                ),
              ),
            );
          } else if (state is RestaurantDetailError) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: zBackgroundColor,
                elevation: 0,
                title: const Text("Detail Restoran",
                    style: TextStyle(color: Colors.black)),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              body: Center(
                child: Text(
                  "Error: ${state.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          } else {
            return const SizedBox(); // Mengembalikan SizedBox kosong secara default
          }
        },
      ),
    );
  }
}
