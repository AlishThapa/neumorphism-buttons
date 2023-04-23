import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:neumorphism/neumorphism/neumorphism.dart';
// another one

class Neumorphism1 extends StatefulWidget {
  const Neumorphism1({Key? key}) : super(key: key);

  @override
  State<Neumorphism1> createState() => _Neumorphism1State();
}

class _Neumorphism1State extends State<Neumorphism1> {
  bool isPressed = false;
  bool isDarkMode = true;
  //for dark mode

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? const Color(0xff2e3239) : const Color(0xffe7ecef);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: GestureDetector(
          //we'll use it at last
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NeumorphismButton(),
              ),
            );
          },
          child: Listener(
            onPointerUp: (_) {
              setState(() {
                isPressed = false;
              });
            },
            onPointerDown: (_) {
              setState(() {
                isPressed = true;
              });
            },
            //this is for the button to move back to initial state right after it is being clicked
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: backgroundColor,
                boxShadow:
                    //if we want to hide the shadow when pressed then we can do this
                    //   isPressed ? [] :
                    [
                  BoxShadow(
                    blurRadius: isPressed ? 5.0 : 30,
                    offset: isPressed ? const Offset(10, 10) : const Offset(-28, -28),
                    color: isDarkMode ? const Color(0xff35393f) : Colors.white,
                    inset: isPressed,
                    //to use insets we have to do some modification
                    //firstly we have to import a package named  flutter_inset_box_shadow
                    //and then we have to modify the import section
                    //using the new package creates a conflict in between predefined package and the imported package.
                  ),
                  BoxShadow(
                    blurRadius: isPressed ? 5.0 : 30,
                    offset: isPressed ? const Offset(10, 10) : const Offset(28, 28),
                    color: isDarkMode ? const Color(0xff23262a) : const Color(0xffa7a9af),
                    inset: isPressed,
                  ),
                ],
              ),
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Icon(
                  Icons.favorite,
                  color: Colors.amberAccent,
                ),
              ),
              //so that the button have some property
              // like if we want to add icon we can use it as a child property
            ),
          ),
        ),
      ),
    );
  }
}
