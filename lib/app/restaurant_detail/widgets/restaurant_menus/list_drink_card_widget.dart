import 'package:flutter/material.dart';
import '../../../constant/color.dart';
import '../../../data/models/restaurant_model.dart';

Widget listDrinkCard(BuildContext context, Menus menu, index) {
  return Card(
    color: Colors.white70,
    shadowColor: zPrimaryColor.withOpacity(0.9),
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {},
      child: SizedBox(
          width: 150,
          child: Center(
            child: Text(
              menu.drinks[index].name,
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
