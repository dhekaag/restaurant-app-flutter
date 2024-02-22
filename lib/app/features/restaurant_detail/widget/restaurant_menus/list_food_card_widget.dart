import 'package:flutter/material.dart';
import 'package:restaurant_app/app/constant/color.dart';
import 'package:restaurant_app/app/data/models/restaurant_detail_model.dart';

Widget listFoodCard(BuildContext context, int index, RestaurantDetailModel restaurant) {
  return Card(
    color: Colors.white70,
    shadowColor: zPrimaryColor.withOpacity(0.9),
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {},
      child: SizedBox(
        height: 150,
        width: 150,
        child: Center(
          child: Text(
            restaurant.menus!.foods![index]!.name!,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
  );
}
