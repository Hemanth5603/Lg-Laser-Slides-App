
import 'package:flutter/material.dart';

Widget circle(w,h,double left,color){
  return Positioned(
    bottom: -120,
    left: left,
    child: Container(
      width:w > 1000 ? 200 : 160,
      height: w > 1000 ? 200 : 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color:color
      ),
    ),
  );
}

