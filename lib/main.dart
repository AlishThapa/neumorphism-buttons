import 'package:flutter/material.dart';
import 'package:neumorphism/neumorphism/animated_N_Icon.dart';

import 'neumorphism/neumorphism.dart';
import 'neumorphism/neumorphism_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Neumorphism1(),
    );
  }
}
