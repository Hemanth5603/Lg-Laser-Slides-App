import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/views/about.dart';
import 'package:laser_slides/views/home_page.dart';
import 'package:laser_slides/widgets/circle.dart';
import 'package:laser_slides/widgets/custom_card.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selectedIndex = 0;

  List screens = [
    const HomePage(),
    const About()
  ];
  OSCController oscController = Get.put(OSCController());
  bool isChecked = false;
  

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
        Container(
          height: w > 1000 ?h * 0.15 : h * 0.12,
          width: w,
            padding:const EdgeInsets.only(left: 30,top:60),
            child:Text("Welcome to Laser Slides !",style: TextStyle(fontFamily: 'sen',fontSize: w > 1000 ? 60:25),),
        ),

        Positioned(
          top:w > 1000 ?  h * 0.16: h * 0.12,
          child: Container(
            height: h * 0.1,
            width: w,
              padding:const EdgeInsets.only(left: 30,top:0),
              child:Text("Your ultimate presentation companion",style: TextStyle(fontFamily: 'sen',fontSize: w > 1000 ? 30:15,color: Colors.grey),),
          ),
        ),
          Center(
            child: Container(
              width: w,
              height: w > 1000 ? h * 0.7 : h * 0.9,
              padding: EdgeInsets.only(top: w > 1000 ? 100: 50,left: 40,right: 40),
              child: AnimationLimiter(
                child: GridView.count(
                  scrollDirection: w > 1000 ? Axis.vertical : Axis.vertical ,
                  crossAxisSpacing: 30,
                  crossAxisCount:  MediaQuery.of(context).size.width > 1000 ? 3 : 1,
                    children: List.generate(3,
                      (int index){
                        return AnimationConfiguration.staggeredGrid(
                          position: index, 
                          duration: const Duration(milliseconds: 375),
                          columnCount:  MediaQuery.of(context).size.width > 1000 ? 3 : 1,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: CustomCard(index: index,oscController: oscController,),
                            ),
                          )
                        );
                      }
                    ),
                  ),
              ),
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
      ),
    );
  }
}





/*

SafeArea(
        child: screens[selectedIndex!],
      ),
*/ 