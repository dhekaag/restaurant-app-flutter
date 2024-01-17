// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:restaurant_app/app/constant/color.dart';

import 'package:restaurant_app/app/data/models/restaurant_model.dart';

import 'widgets/restaurant_description/restaurant_description_widget.dart';
import 'widgets/restaurant_menus/restaurant_menus_widget.dart';
import 'widgets/restaurant_title/restaurant_title_widget.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: zBackgroundColor,
          elevation: 0,
          title: Text(restaurant.name,
              style: Theme.of(context).textTheme.titleSmall),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 25,
                color: Colors.black,
              )),
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
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),

              // * Restaurant name,location and rating
              RestaurantTitle(restaurant: restaurant),
              Divider(
                color: zHintColor,
              ),

              // * Restaurant description
              RestaurantDescription(size: size, restaurant: restaurant),
              Divider(
                color: zHintColor,
              ),

              // * Restaurant Menus
              RestaurantMenus(size: size, restaurant: restaurant),
            ],
          ),
        ));
  }
}
