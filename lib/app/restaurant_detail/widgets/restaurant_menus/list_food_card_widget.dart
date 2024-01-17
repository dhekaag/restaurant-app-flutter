import 'package:flutter/material.dart';
import 'package:restaurant_app/app/data/models/restaurant_model.dart';
import '../../../constant/color.dart';

Widget listFoodCard(BuildContext context, Menus menu, index) {
  return Card(
    color: Colors.white70,
    shadowColor: zPrimaryColor.withOpacity(0.9),
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {},
      child: SizedBox(
          height: 0,
          width: 150,
          child: Center(
            child: Text(
              menu.foods[index].name,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ),
  );
}
