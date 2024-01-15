import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/widgets/circle.dart';
import 'package:laser_slides/widgets/slides_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OSCController oscController = Get.put(OSCController());
  double turn = 0.0;
  bool state = false;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    
    return  Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:const EdgeInsets.only(top:30),
                child: Stack(
                  children: [
                    AnimationLimiter(
                      child: GridView.count(
                        crossAxisCount:  MediaQuery.of(context).size.width > 1000 ? 6 : 2,
                        children: List.generate(18,
                          (int index){
                            return AnimationConfiguration.staggeredGrid(
                              position: index, 
                              duration: const Duration(milliseconds: 375),
                              columnCount:  MediaQuery.of(context).size.width > 1000 ? 6 : 3,
                              child: ScaleAnimation(
                                curve: Curves.easeInOutQuad,
                                child: FadeInAnimation(
                                  child: CustomButton(index: index,controller: oscController,state: state)
                                ),
                              )
                            );
                          }
                        ),
                      ),
                    ),   
                  ],
                ),
              ),
              circle(w, h, -20, const Color.fromARGB(218, 33, 149, 243)),
              circle(w, h, 150, const Color.fromARGB(218, 244, 67, 54)),
              circle(w, h, 300, const Color.fromARGB(215, 255, 235, 59)),
              circle(w, h, 450, const Color.fromARGB(213, 76, 175, 79)),
              circle(w, h, 600, const Color.fromARGB(218, 33, 149, 243)),
              circle(w, h, 750, const Color.fromARGB(218, 244, 67, 54)),
              circle(w, h, 900, const Color.fromARGB(215, 255, 235, 59)),
              circle(w, h, 1050, const Color.fromARGB(213, 76, 175, 79)),
              circle(w, h, 1200, const Color.fromARGB(218, 33, 149, 243)),
            ],
          )
        ),
      );
  }
}