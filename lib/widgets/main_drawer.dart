import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8)
          ], begin: Alignment.topRight, end: FractionalOffset.bottomRight)),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Cooking of..',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.food_bank,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap: () {
            onSelectScreen('Meals');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap: () {
            onSelectScreen('filters');
          },
        )
      ],
    ));
  }
}
