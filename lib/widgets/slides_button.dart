import 'package:flutter/material.dart';
import 'package:laser_slides/models/boxes.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/models/slide.dart';
import 'package:laser_slides/widgets/dialog_textfield.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  static const double _shadowHeight = 8;
  CustomButton({
    super.key,
    required this.index,
    required this.controller,
    required this.state,

  });
  int index;
  OSCController controller;
  bool state;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
double _position = 8;



@override
Widget build(BuildContext context) {
  double h = MediaQuery.of(context).size.height;
  Slide slide = boxSLides.get(widget.index.toString());
  const double height = 140 - CustomButton._shadowHeight;
  double rotationAngle = 0.0;
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
           rotationAngle += 45;
         });

         widget.controller.sendMessage(slide.command);
       },
       onTapCancel: () {
         setState(() {
           _position = 8;
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
            child: Container(
              height: h * 0.61,
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              width: MediaQuery.of(context).size.width > 1000 ? 600 : 300 ,
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
              child: ListView(
                children: <Widget>[
                  const Text('Edit Button',style: TextStyle(fontSize: 20,fontFamily: 'sen',fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),  
                  CustomDialogTextField(hint: slide.label,label: slide.label, title: "Label",controller: widget.controller.buttonLabelController,),
                  const SizedBox(height: 15.0),
                  CustomDialogTextField(hint: slide.command,label: slide.command, title: "Path",controller: widget.controller.pathController,),
                  const SizedBox(height: 15.0),
                  CustomDialogTextField(hint: slide.command,label: slide.command, title: "Button Pressed",controller: widget.controller.commandController,),
                  const SizedBox(height: 15.0),
                  CustomDialogTextField(hint: "Btn 1/1",label: 'Btn 1/1', title: "Button released",controller: widget.controller.buttonReleasedController,),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          boxSLides.put(
                            widget.index.toString(),
                            Slide(label: widget.controller.buttonLabelController.text, command: widget.controller.commandController.text)
                          );
                        });
                        setState(() {
                          widget.controller.buttonLabelController.text = "";
                          widget.controller.commandController.text = "";
                        });
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
                        setState(() {
                          widget.controller.buttonLabelController.text = "";
                          widget.controller.commandController.text = "";
                        });
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
            )
          );
          }
        ); 
       },
       child: GestureDetector(
         child: Transform.rotate(
          angle: rotationAngle * (3.14/180),
           child: SizedBox(
             height: height + CustomButton._shadowHeight,
             width: 140,
             child: Stack(
               children: [
                 Positioned(
                   bottom: 0,
                   child: Container(
                     height: height,
                     width: 140,
                     decoration: BoxDecoration(
                       color: widget.index % 2 ==0 ? const Color.fromARGB(117, 0, 107, 194): const Color.fromARGB(136, 194, 0, 3),
                       borderRadius: const BorderRadius.all(
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
                     height: height,
                     width: 140,
                     decoration:  BoxDecoration(
                      gradient:widget.index % 2 ==0 ? const LinearGradient(
                        colors: [
                          Color.fromARGB(215, 0, 107, 194),
                          Color.fromARGB(255, 0, 107, 194),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ) : 
                      const LinearGradient(
                        colors: [
                          Color.fromARGB(136, 194, 0, 3),
                          Color.fromARGB(255, 194, 0, 3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                       color: const Color.fromARGB(213, 55, 55, 55), 
                       borderRadius:const BorderRadius.all(
                         Radius.circular(16),
                       ),
                     ),
                     child: Center(
                       child: Text(
                        slide.label,
                         style: const TextStyle(
                           color: Color.fromARGB(255, 255, 255, 255),
                           fontSize: 25,
                           fontFamily: 'sen',
                           fontWeight: FontWeight.bold
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
   ),
 );
}
}
