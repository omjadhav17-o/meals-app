import 'package:flutter/material.dart';
import 'package:meals_app/models/filter_provider.dart';

import 'package:meals_app/screens/catogerysreen.dart';
import 'package:meals_app/screens/filter_screen.dart';
//import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/mealscreen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/favourite_meals.dart';

final Kintalisedfilters = {
  Filter.glutinefree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarin: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenstate();
  }
}

class _TabScreenstate extends ConsumerState<TabScreen> {
  int selectedpageindex = 0;

  //the below function checks weather the given function is passed to is in list or not
  // if it is in list then remove it and if it not presend in list the simply remove
  // void _togglemealsfavoritestatus(Meal meal) {
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //     });
  //   }
  // }

  void _onSelect(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      //like List<> we can use push is also generic type so

      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (context) => const FilteredScreen()));
    }
  }

  void _selectedpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //when the data in the watch() changes the builder is reexcuted

    final AvailableMeals = ref.watch(filteredAvailableScreen);
    Widget acitve = CatogeriesScreen(
      available: AvailableMeals,
    );
    var activetitle = 'catogery';
    if (selectedpageindex == 1) {
      final favourites = ref.watch(FavouriteMealsprovider);
      acitve = MealScreen(
        title: 'title',
        meals: favourites,
      );
      activetitle = 'favourate';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: MainDrawer(onSelectScreen: _onSelect),
      body: acitve,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedpageindex,
          onTap: _selectedpage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Catogeries'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorates'),
          ]),
    );
  }
}
