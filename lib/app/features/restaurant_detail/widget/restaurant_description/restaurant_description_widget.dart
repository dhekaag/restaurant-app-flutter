import 'package:flutter/material.dart';
import 'package:restaurant_app/app/data/models/restaurant_detail_model.dart';

class RestaurantDescription extends StatelessWidget {
  const RestaurantDescription({
    super.key,
    required this.size,
    required this.restaurant,
  });

  final Size size;
  final RestaurantDetailModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Text(
            restaurant.description!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                ),
            textAlign: TextAlign.justify,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
