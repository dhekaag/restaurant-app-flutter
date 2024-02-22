// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/app/data/services/restaurant_services.dart';
import 'package:restaurant_app/app/features/restaurant_list/bloc/restaurant_list_bloc.dart';
import 'widgets/restaurant_list_card_widget.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            RestaurantListBloc(restaurantService: RestaurantService()),
        child: Scaffold(
            appBar: null,
            body: BlocBuilder<RestaurantListBloc, RestaurantListState>(
              builder: (context, state) {
                if (state is RestaurantListLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RestaurantListError) {
                  return Center(
                    child: Text("Error loading data: ${state.error}"),
                  );
                } else if (state is RestaurantListLoaded) {
                  final data = state.restaurants;
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
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
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
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
                                data![index]!,
                              ),
                            );
                          },
                          childCount: data?.length,
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            )));
  }
}
