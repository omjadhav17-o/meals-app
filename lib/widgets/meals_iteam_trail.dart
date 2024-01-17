import 'package:flutter/material.dart';

class MealsIteamTrait extends StatelessWidget {
  const MealsIteamTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white70,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}
