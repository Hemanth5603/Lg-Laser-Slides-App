import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
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
                        crossAxisCount:  MediaQuery.of(context).size.width > 1000 ? 6 : 3,
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
              Positioned(
            bottom: -120,
            left: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(218, 33, 149, 243)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 150,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(218, 244, 67, 54)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 300,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(215, 255, 235, 59)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 450,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(213, 76, 175, 79)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 600,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(227, 244, 67, 54)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 750,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(218, 255, 235, 59)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 900,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(222, 33, 149, 243)
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            left: 1050,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(222, 244, 67, 54)
              ),
            ),
          ),Positioned(
            bottom: -120,
            left: 1200,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color.fromARGB(225, 76, 175, 79)
              ),
            ),
          ),
            ],
          )
        ),
      );
  }
}