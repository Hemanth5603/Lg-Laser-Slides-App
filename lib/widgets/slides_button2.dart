import 'package:flutter/material.dart';
import 'package:laser_slides/models/boxes.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/models/slide.dart';
import 'package:laser_slides/widgets/dialog_textfield.dart';

// ignore: must_be_immutable
class CustomButton2 extends StatefulWidget {
  static const double _shadowHeight = 8;
  CustomButton2({
    super.key,
    required this.index,
    required this.controller

  });
  int index;
  OSCController controller;
  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
double _position = 6;



@override
Widget build(BuildContext context) {
  double h = MediaQuery.of(context).size.height;
  Slide slide = boxSLides.get(widget.index.toString());
  const double height = 110 - CustomButton2._shadowHeight;
  double rotationAngle = 0.0;
 return Scaffold(
   body: Center(
     child: GestureDetector(
       onTap: (){
        setState(() {
          rotationAngle += 1/4;
        });
        print("tap");
         //widget.controller.sendMessage(slide.command);
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
       child: AnimatedRotation(
          turns: rotationAngle,
          duration: Duration(seconds: 1),
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
     ),
    );
  }
}
