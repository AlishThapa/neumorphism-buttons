import 'package:flutter/material.dart';
import 'animated_N_Icon.dart';

class NeumorphismButton extends StatefulWidget {
  const NeumorphismButton({Key? key}) : super(key: key);

  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff333333),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnimatedIconNe(),
                ),
              );
            },
            icon: const Icon(Icons.navigate_next, color: Colors.amber),
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        color: const Color(0xff333333),
        alignment: Alignment.center,
        transformAlignment: Alignment.center,
        child: Container(
          color: const Color(0xff333333),
          child: Container(
            width: 133,
            height: 133,
            decoration: BoxDecoration(
              color: const Color(0xff333333),
              borderRadius: BorderRadius.circular(33),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff333333),
                  Color(0xff333333),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff656565),
                  offset: Offset(-19.4, -19.4),
                  blurRadius: 16,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Color(0xff010101),
                  offset: Offset(19.4, 19.4),
                  blurRadius: 16,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: const Icon(
              Icons.star,
              size: 44,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
