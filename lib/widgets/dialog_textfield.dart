import 'package:flutter/material.dart';


class CustomDialogTextField extends StatefulWidget {
  CustomDialogTextField({
    super.key,
    required this.hint,
    required this.title,
    required this.controller,
    required this.label,
  });
  String label;
  String title;
  String hint;
  TextEditingController controller; 
  @override
  State<CustomDialogTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomDialogTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: const TextStyle(fontFamily: 'sen',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
          const SizedBox(height: 5,),
          Material(
            borderRadius:BorderRadius.circular(10),
            child: TextField(
              controller: widget.controller,
                style: const TextStyle(color: Color.fromARGB(255, 34, 34, 34),fontFamily: 'sen'), 
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 77, 77, 77)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}



