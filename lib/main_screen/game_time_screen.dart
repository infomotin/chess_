import 'package:chess/helpper/helpper_method.dart';
import 'package:chess/main_screen/game_start_up_screen.dart';
import 'package:flutter/material.dart';

class GameTimeScreen extends StatefulWidget {
  const GameTimeScreen({super.key});

  @override
  State<GameTimeScreen> createState() => _GameTimeScreenState();
}

class _GameTimeScreenState extends State<GameTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 49, 226, 217),
          title: const Text(
            'Select Game Time',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.5),
            itemCount: gameTime.length,
            itemBuilder: (context, index) {
              final String label = gameTime[index].split(' ')[0];
              final String GameTime = gameTime[index].split(' ')[1];
              return buildGameType(
                label: label,
                gameTime: GameTime,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameStartUpScreen(),
                      ));
                },
              );
            }));
  }
}
