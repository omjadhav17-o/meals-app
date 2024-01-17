import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meals_iteam_trail.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealsiteam extends StatelessWidget {
  const Mealsiteam({super.key, required this.meal, required this.deailsreen});
  final Meal meal;

  final void Function(Meal meal) deailsreen;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          deailsreen(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                right: 0,
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsetsDirectional.all(8),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        style: const TextStyle(
                            color: Color.fromARGB(96, 238, 233, 233),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          MealsIteamTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} MIN'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealsIteamTrait(
                              icon: Icons.work,
                              label: '${meal.complexity.name} MIN'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealsIteamTrait(
                              icon: Icons.attach_money,
                              label: '${meal.affordability.name} MIN'),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
