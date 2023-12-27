import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_slides/constants/app_constants.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/views/tabs/about.dart';
import 'package:laser_slides/views/tabs/home_page.dart';
import 'package:laser_slides/widgets/custom_textfield.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selectedIndex = 0;

  List screens = [
    HomePage(),
    const About()
  ];
  OSCController oscController = Get.put(OSCController());
  bool isChecked = false;
  late ConfettiController confettiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confettiController = ConfettiController(duration: Duration(seconds: 2));
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 240, 204, 204),
        title: const Text("Laser Slides",style: TextStyle(fontFamily: 'sen',fontSize: 20),),
        actions: [
          InkWell(
              child:const  Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.settings),
            ),
            onTap: (){
              Get.bottomSheet(
                Stack(
                  children: [
                    Container(
                      height: h * 0.8,
                      padding:const  EdgeInsets.all(10),
                      decoration:const BoxDecoration(
                        color: Color.fromARGB(255, 241, 241, 241),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 5,
                              decoration: const BoxDecoration(
                                 color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Network Settings",
                                    style: TextStyle(
                                      fontFamily: 'sen',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height:15,),
                                  SizedBox(
                                    height: h * 0.46,
                                    child: ListView(
                                      
                                      children: [
                                        const Text("Outgoing",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 10,),
                                        CustomTextField(title:"IP Address",hint:"127.0.0.1",textController: oscController.outgoingIpController,),
                                        const SizedBox(height: 15,),
                                        CustomTextField(title:"PORT",hint:"8000",textController: oscController.outPortController),
                                        const SizedBox(height: 15,),
                                        CustomTextField(title:"Start Path",hint:"/",textController: oscController.startPathController),
                                        const SizedBox(height: 20,),
                                        const Text("Incomming",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 10,),
                                        /*Checkbox(
                                          value: isChecked,
                                          onChanged: (bool? value){
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          }
                                        ),*/
                                        CustomTextField(title:"IP Address",hint:"127.0.0.1",textController: oscController.incomingIpController),
                                        const SizedBox(height: 15,),
                                        CustomTextField(title:"PORT",hint:"8000",textController: oscController.inPortController),
                                        const SizedBox(height: 15,),
                                        GestureDetector(
                                          onTap: (){
                                            Get.back();
                                          },
                                          child:GestureDetector(
                                            child: Container(
                                              width: w * 0.95,
                                                height: h * 0.07,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color:const Color.fromARGB(255, 62, 62, 62) ),
                                                  color: const Color.fromARGB(255, 247, 247, 247),
                                                  borderRadius:const  BorderRadius.all(Radius.circular(10)),
                                                ),
                                                child:const  Center(
                                                  child: Text("Save Changes",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                                ),
                                              ),
                                              onTap: (){
                                                bool check = oscController.checkConnection();
                                                if(check){
                                                  FloatingSnackBar( 
                                                    message: 'Connection Successful 😇', 
                                                    context: context, 
                                                    textColor: Colors.black, 
                                                    textStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),), 
                                                    duration: const Duration(milliseconds: 4000), 
                                                    backgroundColor: Colors.green, 
                                                    ); 
                                                }else{
                                                  confettiController.play();
                                                  FloatingSnackBar( 
                                                    message: 'Connection unsuccessful 😥', 
                                                    context: context, 
                                                    textColor: Colors.black, 
                                                    textStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),), 
                                                    duration: const Duration(milliseconds: 4000), 
                                                    backgroundColor: Colors.red, 
                                                  ); 
                                                }
                                                Get.back();
                                              },
                                          ),
                                        )                
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ConfettiWidget(
                        confettiController: confettiController,
                        blastDirection: -pi / 2,
                      )


                    )
                  ],
                )
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:AppConstants.bottomNavBarItems,
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 74, 74, 74),
        elevation: 5,
        currentIndex: selectedIndex!,
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: SafeArea(
        child: screens[selectedIndex!],
      ),
    );
  }
}
