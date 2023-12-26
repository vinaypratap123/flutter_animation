import 'dart:math';

import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  List<Color> currentPalette = generateRandomPalette();

  static List<Color> generateRandomPalette() {
    final random = Random();
    return List.generate(
      5,
      (_) => Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
    );
  }

  void generatePalette() {
    setState(() {
      currentPalette = generateRandomPalette();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Color Palette Generator"),
      ),
      body: Center(
        child: Column(
          children: [
            for (Color color in currentPalette)
              AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                // curve: Curves.decelerate,
                // curve: Curves.easeIn,
                curve: Curves.easeOut,
                height: 100,
                width: 100,
                color: color,
                margin: const EdgeInsets.all(10),
              ),
            ElevatedButton(
                onPressed: () {
                  generatePalette();
                },
                child: const Text("Generate new palette"))
          ],
        ),
      ),
    );
  }
}
