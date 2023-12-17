import 'package:flutter/material.dart';


class OnBoardButton extends StatefulWidget {
  static const double _shadowHeight = 8;

  const OnBoardButton({super.key});

  @override
  State<OnBoardButton> createState() => _OnBoardButtonState();
}

class _OnBoardButtonState extends State<OnBoardButton> {
double _position = 8;

@override
Widget build(BuildContext context) {
 final double _height = 40 - OnBoardButton._shadowHeight;
 return Scaffold(
   body: Center(
     child: GestureDetector(
       onTapUp: (_) {
         setState(() {
           _position = 8;
         });
       },
       onTapDown: (_) {
         setState(() {
           _position = 0;
         });
       },
       onTapCancel: () {
         setState(() {
           _position = 8;
         });
       },
       child: SizedBox(
         height: _height + OnBoardButton._shadowHeight,
         width: 150,
         child: Stack(
           children: [
             Positioned(
               bottom: 0,
               child: Container(
                 height: _height,
                 width: 500,
                 decoration: const BoxDecoration(
                   color: Color.fromARGB(255, 121, 121, 121),
                   borderRadius: BorderRadius.all(
                     Radius.circular(16),
                   ),
                 ),
               ),
             ),
             AnimatedPositioned(
               curve: Curves.easeIn,
               bottom: _position,
               duration:const Duration(milliseconds: 70),
               child: Container(
                 height: _height,
                 width: 500,
                 decoration: const BoxDecoration(
                   color: Color.fromARGB(255, 223, 223, 223),
                   borderRadius: BorderRadius.all(
                     Radius.circular(16),
                   ),
                 ),
                 child: const Center(
                   child: Text(
                     'Continue',
                     style: TextStyle(
                       color: Color.fromARGB(255, 0, 0, 0),
                       fontSize: 22,
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   ),
 );
}
}
