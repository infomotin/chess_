import 'package:flutter/material.dart';

class GameStartUpScreen extends StatefulWidget {
  const GameStartUpScreen({super.key});

  @override
  State<GameStartUpScreen> createState() => _GameStartUpScreenState();
}

class _GameStartUpScreenState extends State<GameStartUpScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 226, 217),
        title: const Text(
          'Game Start Up Screen',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}