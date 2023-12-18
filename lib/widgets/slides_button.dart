import 'package:flutter/material.dart';
import 'package:laser_slides/widgets/dialog_textfield.dart';


// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  static const double _shadowHeight = 8;

  CustomButton({
    super.key,
    required this.index,

  });
  int index;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
double _position = 6;

@override
Widget build(BuildContext context) {
 final double _height = 100 - CustomButton._shadowHeight;
 return Scaffold(
   body: Center(
     child: GestureDetector(
       onTapUp: (_) {
         setState(() {
           _position = 6;
         });
       },
       onTapDown: (_) {
         setState(() {
           _position = 0;
         });
       },
       onTapCancel: () {
         setState(() {
           _position = 6;
         });
       },
       onDoubleTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: contentBox(context),
          );
          }
        );
        
       },
       child: GestureDetector(
        onLongPress: (){
          
        },
         child: SizedBox(
           height: _height + CustomButton._shadowHeight,
           width: 100,
           child: Stack(
             children: [
               Positioned(
                 bottom: 0,
                 child: Container(
                   height: _height,
                   width: 100,
                   decoration: const BoxDecoration(
                     color: Color.fromARGB(255, 28, 28, 28),
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
                   width: 100,
                   decoration: const BoxDecoration(
                     color: Color.fromARGB(213, 55, 55, 55), 
                     borderRadius: BorderRadius.all(
                       Radius.circular(16),
                     ),
                   ),
                   child: Center(
                     child: Text(
                       "Slide ${widget.index+1}",
                       style: const TextStyle(
                         color: Colors.white,
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
   ),
 );
}
}

Widget contentBox(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Edit Button',style: TextStyle(fontSize: 20,fontFamily: 'sen',fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          CustomDialogTextField(hint: "Slide 1", title: "Label"),
          const SizedBox(height: 15.0),
          CustomDialogTextField(hint: "Btn 1/2", title: "Button Pressed"),
          const SizedBox(height: 15.0),
          CustomDialogTextField(hint: "Btn 1/1", title: "Button released"),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child:Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color:const Color.fromARGB(255, 62, 62, 62) ),
                    color: const Color.fromARGB(255, 247, 247, 247),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text("Save",style: TextStyle(fontFamily: 'sen',fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child:Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color:const Color.fromARGB(255, 62, 62, 62) ),
                    color: const Color.fromARGB(255, 247, 247, 247),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text("Cancel",style: TextStyle(fontFamily: 'sen',fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

