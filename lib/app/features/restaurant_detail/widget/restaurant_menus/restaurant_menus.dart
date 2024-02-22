import 'package:flutter/material.dart';
import 'package:restaurant_app/app/data/models/restaurant_detail_model.dart';
import 'list_drink_card_widget.dart';
import 'list_food_card_widget.dart';

class RestaurantMenus extends StatelessWidget {
  const RestaurantMenus({
    super.key,
    required this.size, required this.restaurant,
  });

  final Size size;
  final RestaurantDetailModel restaurant;

  @override
  Widget build(BuildContext context) {
    {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              "Menus",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Food :",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          // * list food menu items
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: size.width,
            height: 50,
            child: ListView.builder(
              itemCount: restaurant.menus!.foods!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return listFoodCard(context, index, restaurant);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Drink :",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          // * list drink menu items
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: size.width,
            height: 50,
            child: ListView.builder(
              itemCount: restaurant.menus!.drinks!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return listDrinkCard(context, index, restaurant);
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    }
  }
}
