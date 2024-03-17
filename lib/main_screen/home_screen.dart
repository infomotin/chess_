import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 49, 226, 217),
            title: const Text(
              'Flutter Chess',
              style: TextStyle(color: Colors.black),
            )),
        body: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          children: [
            Card(
              child: Column(
                children: [
                  Icon(Icons.computer)
                ],
              ),
            )
          ],
        ));
  }
}
