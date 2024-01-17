import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CatogeryIteams extends StatelessWidget {
  const CatogeryIteams(
      {super.key, required this.catogery, required this.onSelect});

  final Category catogery;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            catogery.color.withOpacity(0.75),
            catogery.color.withOpacity(0.75)
          ], begin: Alignment.topRight, end: Alignment.topLeft),
        ),
        child: Text(
          catogery.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
