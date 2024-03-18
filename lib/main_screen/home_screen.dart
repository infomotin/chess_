import 'dart:math';
import 'package:chess/helpper/helpper_method.dart';
import 'package:chess/main_screen/about_screen.dart';
import 'package:chess/main_screen/game_time_screen.dart';
import 'package:chess/main_screen/setting_screen.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              buildGameType(
                  label: 'Play Vs Computer',
                  icon: Icons.computer,
                  onTap: () {
                    print("play vs computer");
                    //Navigate to game time Screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameTimeScreen()));
                  }),
              buildGameType(
                  label: 'Play Vs Friend',
                  icon: Icons.person,
                  onTap: () {
                    print("play vs friend");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GameTimeScreen()));
                  }),
              buildGameType(
                  label: 'About Us',
                  icon: Icons.info,
                  onTap: () {
                    print("about us");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutScreen()));
                  }),
              buildGameType(
                  label: 'Settings',
                  icon: Icons.settings, 
                  onTap: () {
                   print("settings");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
                  }),
            ],
          ),
        ));
  }
}

