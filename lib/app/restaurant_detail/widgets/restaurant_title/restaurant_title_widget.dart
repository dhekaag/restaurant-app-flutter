import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:restaurant_app/app/constant/color.dart';
import 'package:restaurant_app/app/data/models/restaurant_model.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(
                Iconsax.location5,
                size: 18,
                color: zPrimaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                restaurant.city,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 18,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                restaurant.rating.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}
