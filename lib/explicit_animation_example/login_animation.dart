import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> textFieldSlideAnimation;
  late Animation<double> scaleTextFieldSlideAnimation;

  late Animation<Offset> buttonSlideAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      controller,
    );
    textFieldSlideAnimation =
        Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero)
            .animate(controller);
    buttonSlideAnimation =
        Tween<Offset>(begin: const Offset(1, 1), end: Offset.zero)
            .animate(controller);
    scaleTextFieldSlideAnimation =
        Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login Animation"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: logoFadeAnimation,
                child: const FlutterLogo(
                  size: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SlideTransition(
                  position: textFieldSlideAnimation,
                  child: ScaleTransition(
                    scale: scaleTextFieldSlideAnimation,
                    child: const Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: "Email"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Password"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SlideTransition(
                  position: buttonSlideAnimation,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("LOGIN"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
