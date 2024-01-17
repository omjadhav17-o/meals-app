import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

//in this module we use state notifier so that we can store a dynamic data
class FavouriteMealsnotifire extends StateNotifier<List<Meal>> {
  FavouriteMealsnotifire() : super([]);

  void togglemealsfavorite(Meal meal) {
    //contains checks wheater the list contains the meal or not is contains then true
    final Isfavouirte = state.contains(meal);
    if (Isfavouirte) {
      //here we compare every element in the list and
      //filter is the meal we get in filter is same to the element in the list
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final FavouriteMealsprovider =
    StateNotifierProvider<FavouriteMealsnotifire, List<Meal>>(
        (ref) => FavouriteMealsnotifire());
