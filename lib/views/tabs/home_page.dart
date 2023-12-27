import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:laser_slides/config/theme_service.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/widgets/slides_button.dart';
import 'package:laser_slides/widgets/slides_button2.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            state = !state;
            print(state);
          });
          
        },
        child: Container()
      ),
        body: SafeArea(
          child: Padding(
            padding:const EdgeInsets.all(0),
            child: Stack(
              children: [
                /*GridView.builder(
                  itemCount: 18,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 6 : 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemBuilder: (context,index){ 
                    return CustomButton(index: index,controller: oscController,state: state);
                  },
                ),*/
               
                AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount:  MediaQuery.of(context).size.width > 1000 ? 6 : 3,
                    children: List.generate(18,
                      (int index){
                        return AnimationConfiguration.staggeredGrid(
                          position: index, 
                          duration: Duration(milliseconds: 375),
                          columnCount:  MediaQuery.of(context).size.width > 1000 ? 6 : 3,
                          child: ScaleAnimation(
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
          )
        ),
      );
  }
}