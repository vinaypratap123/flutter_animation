import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  bool isExpanded = false;
  void changeButton() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Animated Shopping Cart Button"),
      ),
      body: InkWell(
        onTap: (){
          changeButton();
        },
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            height: isExpanded ? 40 : 40,
            width: isExpanded ? 200 : 60,
            decoration: BoxDecoration(
                color: isExpanded ? Colors.green : Colors.blue,
                borderRadius: isExpanded
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(5)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    isExpanded ? Icons.check : Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  isExpanded
                      ? const SizedBox(
                          width: 5,
                        )
                      : const SizedBox(
                          width: 0,
                        ),
                  isExpanded
                      ? const Text("Item added to cart")
                      : const SizedBox(
                          width: 0,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
