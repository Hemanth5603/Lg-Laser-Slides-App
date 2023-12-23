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
    required this.controller

  });
  int index;
  OSCController controller;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
double _position = 6;



@override
Widget build(BuildContext context) {
  Slide slide = boxSLides.get(widget.index.toString());
  
 const double height = 100 - CustomButton._shadowHeight;
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
         widget.controller.sendMessage(slide.command);
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
            child: Container(
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Edit Button',style: TextStyle(fontSize: 20,fontFamily: 'sen',fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          CustomDialogTextField(hint: slide.label,label: slide.label, title: "Label",controller: widget.controller.buttonLabelController,),
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
        onLongPress: (){
          
        },
         child: SizedBox(
           height: height + CustomButton._shadowHeight,
           width: 100,
           child: Stack(
             children: [
               Positioned(
                 bottom: 0,
                 child: Container(
                   height: height,
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
                   height: height,
                   width: 100,
                   decoration: const BoxDecoration(
                     color: Color.fromARGB(213, 55, 55, 55), 
                     borderRadius: BorderRadius.all(
                       Radius.circular(16),
                     ),
                   ),
                   child: Center(
                     child: Text(
                      slide.label,
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

/*Widget contentBox(context,index,OSCController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Edit Button',style: TextStyle(fontSize: 20,fontFamily: 'sen',fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          CustomDialogTextField(hint: "Slide 1", title: "Label",controller: controller.buttonLabelController,),
          const SizedBox(height: 15.0),
          CustomDialogTextField(hint: "Btn 1/2", title: "Button Pressed",controller: controller.commandController,),
          const SizedBox(height: 15.0),
          CustomDialogTextField(hint: "Btn 1/1", title: "Button released",controller: controller.buttonReleasedController,),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  
                  boxSLides.put(
                    index.toString(),
                    Slide(label: controller.buttonLabelController.text, command: controller.commandController.text)
                  );
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

*/