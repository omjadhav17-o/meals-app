import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/detailsScreen.dart';
import 'package:meals_app/widgets/meals_iteam.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  void onselect(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailedScreen(
        meal: meal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => Mealsiteam(
          meal: meals[index],
          deailsreen: (meal) {
            onselect(meal, context);
          }),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(children: [
          const Text('oh...no iteams found here'),
          const SizedBox(
            height: 16,
          ),
          Text(
            'try selectig another catogery',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
