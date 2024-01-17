import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/meals-provider.dart';

enum Filter {
  glutinefree,
  lactosefree,
  vegan,
  vegetarin,
}

class Filtersnotifier extends StateNotifier<Map<Filter, bool>> {
  Filtersnotifier()
      : super({
          Filter.glutinefree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegetarin: false,
        });
  void setfilters(Map<Filter, bool> setit) {
    state = setit;
  }

  void setfilter(Filter filter, bool isActive) {
    state = {
      ...state, //stores all map values as it is
      filter: isActive //rewrites the changed part in the map
    };
  }
}

final filtersmealsprovider =
    StateNotifierProvider<Filtersnotifier, Map<Filter, bool>>((ref) {
  return Filtersnotifier();
});

final filteredAvailableScreen = Provider((ref) {
  //this below watch() fucntions brings the data from there provider and
  // when the data is changed the fuction is run again with new data
  final ActiveScreen = ref.watch(filtersmealsprovider);
  final meals = ref.watch(mealsProvider);

  return meals.where((meal) {
    if (ActiveScreen[Filter.glutinefree]! && !meal.isGlutenFree) {
      return false;
    }
    if (ActiveScreen[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (ActiveScreen[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (ActiveScreen[Filter.vegetarin]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
