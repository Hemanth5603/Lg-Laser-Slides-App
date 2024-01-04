import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_slides/constants/app_constants.dart';
import 'package:laser_slides/controllers/osc_controller.dart';
import 'package:laser_slides/views/about.dart';
import 'package:laser_slides/views/home_page.dart';
import 'package:laser_slides/widgets/custom_textfield.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
    required this.index,
    required this.oscController,
  });

  int index;
  OSCController oscController;
  @override
  State<CustomCard> createState() => _CustomCardState();
}





class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        if(widget.index == 0) Get.to(HomePage(),transition: Transition.downToUp,duration: Duration(milliseconds: 400));
        else if(widget.index == 1) Get.to(About(),transition: Transition.upToDown,duration: Duration(milliseconds: 400));
        else{
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
                                        CustomTextField(title:"IP Address",hint:"127.0.0.1",textController: widget.oscController.outgoingIpController,),
                                        const SizedBox(height: 15,),
                                        CustomTextField(title:"PORT",hint:"8000",textController: widget.oscController.outPortController),
                                        const SizedBox(height: 15,),
                                        CustomTextField(title:"Start Path",hint:"/",textController: widget.oscController.startPathController),
                                        const SizedBox(height: 20,),
                                        const Text("Incomming",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 10,),
                                        CustomTextField(title:"IP Address",hint:"127.0.0.1",textController: widget.oscController.incomingIpController),
                                        const SizedBox(height: 15,),
                                        CustomTextField(title:"PORT",hint:"8000",textController: widget.oscController.inPortController),
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
                                                bool check = widget.oscController.checkConnection();
                                                if(check){
                                                  FloatingSnackBar( 
                                                    message: 'Connection Successful 😇', 
                                                    context: context, 
                                                    textColor: Colors.black, 
                                                    textStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),), 
                                                    duration: const Duration(milliseconds: 4000), 
                                                    backgroundColor: Color.fromARGB(255, 67, 152, 70), 
                                                    ); 
                                                }else{
                                                  FloatingSnackBar( 
                                                    message: 'Connection unsuccessful 😥', 
                                                    context: context, 
                                                    textColor: Colors.black, 
                                                    textStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),), 
                                                    duration: const Duration(milliseconds: 4000), 
                                                    backgroundColor: const Color.fromARGB(255, 236, 81, 70), 
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
                  ],
                )
              );
        }
      },
      child: Stack(
        children: [
          Container(
            width: w * 0.4,
            height: h * 0.6,
            margin:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: AppConstants.colors[widget.index],
                begin: Alignment.topLeft,
                end: Alignment.topRight
              )
            ),
          ),

          Positioned(
            top:50,
            left: 50,
            child: Text(AppConstants.titles[widget.index],style: TextStyle(fontFamily:'sen',fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          Positioned(
            top:120,
            left: 50,
            child: Text(AppConstants.subtitles[widget.index],style: TextStyle(fontFamily:'sen',fontSize: 20,color: Colors.white),),
          ),
          Positioned( 
            bottom: -20,
            right:-15,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConstants.icons[widget.index])
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}