import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:restaurant_app/app/constant/color.dart';

import '../../data/models/restaurant_model.dart';
import '../../routes/app_routes.dart';

Widget restaurantListCard(BuildContext context, Restaurant restaurant) {
  return Card(
    color: Colors.white70,
    shadowColor: Colors.black.withOpacity(0.8),
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        Navigator.pushNamed(context, Routes.RESTAURANT_DETAIL,
            arguments: restaurant);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 130,
              height: 100,
              decoration: ShapeDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(restaurant.pictureId),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.location5,
                        size: 18,
                        color: zPrimaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(restaurant.rating.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
