import 'package:flutter/material.dart';

class AnimatedIconNe extends StatefulWidget {
  const AnimatedIconNe({Key? key}) : super(key: key);

  @override
  State<AnimatedIconNe> createState() => _AnimatedIconNeState();
}

class _AnimatedIconNeState extends State<AnimatedIconNe> with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController animationController;
  Color customBlackColor = const Color(0xff000000);
  Color customWhiteColor = const Color.fromARGB(255, 237, 237, 237);
  //mixture of white and a lil bit of grey

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      // vsync = this is only possible with TickerProviderMixin
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteColor,
      appBar: AppBar(
        title: const Text('flutter neumorphism button'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: AnimatedRotation(
          turns: turns,
          duration: const Duration(seconds: 1),
          //ease out expo is for faster animation at start with slow at end
          curve: Curves.easeOutExpo,
          child: GestureDetector(
            onTap: () {
              if (isClicked) {
                setState(() {
                  turns -= 1 / 4;
                  isClicked = false;
                });
                animationController.reverse();
              } else {
                setState(() {
                  turns += 1 / 4;
                  isClicked = true;
                });
                animationController.forward();
              }
            },
            child: AnimatedContainer(
              curve: Curves.easeOutExpo,
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: customWhiteColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: isClicked ? const Offset(20, -20) : const Offset(20, 20),
                    color: Colors.grey,
                  ),
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: isClicked ? const Offset(-20, 20) : const Offset(-20, -20),
                    color: Colors.white,
                  ),
                ],
              ),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: animationController,
                    size: 100,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
