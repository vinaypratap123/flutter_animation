import 'package:flutter/material.dart';

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  double size = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pulsating Circle Animation"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          
          tween: Tween<double>(begin: 0, end: 200),
          duration: const Duration(seconds: 2),
          builder: (context, size, child) {
            return Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: size,
                        spreadRadius: size / 2)
                  ],
                  ),
                  child: child,
            );
          },
          child: const Center(child: Text("Hy")),
        ),
      ),
    );
  }
}
