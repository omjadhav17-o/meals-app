import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/mealscreen.dart';
import 'package:meals_app/widgets/catogery_iteams.dart';

class CatogeriesScreen extends StatelessWidget {
  const CatogeriesScreen({super.key, required this.available});

  final List<Meal> available;

  void _selctedcatagory(BuildContext context, Category catogery) {
    final fliteredlist = available
        .where((meal) => meal.categories.contains(catogery.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: catogery.title,
          meals: fliteredlist,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      children: [
        for (final catogery in availableCategories)
          CatogeryIteams(
            catogery: catogery,
            onSelect: () {
              _selctedcatagory(context, catogery);
            },
          )
      ],
    );
  }
}
