import 'package:flutter/material.dart';

class Example3 extends StatefulWidget {
  final double progress;
  final Color color;
  const Example3({super.key, required this.progress, required this.color});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> progressAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    progressAnimation =
        Tween<double>(begin: 0, end: widget.progress).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Animation"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: progressAnimation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                        value: progressAnimation.value,
                        strokeWidth: 10,
                        color: widget.color),
                  ),
                  Text(
                    "${(progressAnimation.value * 100).toInt()}%",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
