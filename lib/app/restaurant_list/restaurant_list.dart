// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restaurant_app/app/data/models/restaurant_model.dart';

import 'widgets/restaurant_list_card_widget.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/json/local_restaurant.json")
            .then((value) => welcomeFromJson(value)),
        builder: (BuildContext context, AsyncSnapshot<Welcome> snapshot) {
          if (snapshot.hasData) {
            final restaurants = snapshot.data!.restaurants;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  pinned: true,
                  centerTitle: false,
                  expandedHeight: size.height * 0.2,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/banner_example.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  pinned: true,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(1.0),
                    child: SizedBox(),
                  ),
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 25,
                    ),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Restaurant",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "Recommendation restaurant for you!",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: restaurantListCard(
                          context,
                          restaurants[index],
                        ),
                      );
                    },
                    childCount: restaurants.length,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading data: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
