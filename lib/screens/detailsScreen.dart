import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/favourite_meals.dart';
//import 'package:meals_app/models/filter_provider.dart';
import 'package:meals_app/models/meal.dart';

class DetailedScreen extends ConsumerWidget {
  const DetailedScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final check = ref.watch(FavouriteMealsprovider);
    bool ispresent = check.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(FavouriteMealsprovider.notifier)
                  .togglemealsfavorite(meal);
            },
            icon: Icon(ispresent ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.network(meal.imageUrl,
              width: double.infinity, height: 300, fit: BoxFit.fill),
          const SizedBox(
            height: 15,
          ),
          Text(
            'ingedradints',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          for (final ingedradints in meal.ingredients)
            Text(
              ingedradints,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'steps',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          for (final ingedradints in meal.steps)
            Text(
              ingedradints,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
        ]),
      ),
    );
  }
}
