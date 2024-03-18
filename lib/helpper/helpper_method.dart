import 'package:flutter/material.dart';

final List<String> gameTime = [
  'Bullet 1+0',
  'Bullet 2+1',
  'Bullet 3+0',
  'Bullet 3+2',
  'Bullet 5+0',
  'Bullet 5+2',
  'Bullet 10+0',
  'Bullet 10+5',
  'Bullet 15+10',
  'Classic 30+0',
  'Classic 30+2',
  'Custom 60+0',
];

Widget buildGameType(
    {required String label,
    String? gameTime,
    IconData? icon,
    required Function() onTap}) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null ? Icon(icon) : gameTime! == '60+0'? const SizedBox.shrink() : Text(gameTime),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
