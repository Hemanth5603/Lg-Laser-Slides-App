import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laser_slides/constants/app_constants.dart';
import 'package:laser_slides/views/about.dart';
import 'package:laser_slides/views/home_page.dart';
import 'package:laser_slides/widgets/custom_textfield.dart';

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


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
            onTap: (){
              Get.bottomSheet(
                Container(
                  height: h * 0.8,
                  padding: EdgeInsets.all(10),
                  decoration:const BoxDecoration(
                    color: const Color.fromARGB(255, 241, 241, 241),
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
                              SizedBox(height:15,),
                              Container(
                                height: h * 0.46,
                                child: ListView(
                                  children: [
                                    const Text("Outgoing",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 10,),
                                    CustomTextField(title:"IP Address",hint:"127.0.0.1"),
                                    SizedBox(height: 15,),
                                    CustomTextField(title:"PORT",hint:"8000"),
                                    SizedBox(height: 15,),
                                    CustomTextField(title:"Start Path",hint:"/"),
                                    SizedBox(height: 15,),
                                    Text("Incomming",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    CustomTextField(title:"IP Address",hint:"127.0.0.1"),
                                    SizedBox(height: 15,),
                                    CustomTextField(title:"PORT",hint:"8000"),
                                    SizedBox(height: 15,),
                                    GestureDetector(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child:Container(
                                        width: w * 0.95,
                                          height: h * 0.07,
                                          decoration: BoxDecoration(
                                            border: Border.all(color:const Color.fromARGB(255, 62, 62, 62) ),
                                            color: const Color.fromARGB(255, 247, 247, 247),
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Center(
                                            child: Text("Save Changes",style: TextStyle(fontFamily: 'sen',fontSize: 20,fontWeight: FontWeight.bold),),
                                          ),
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
                )
              );
            },
          )
        ],
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        title: const Text("Laser Slides",style: TextStyle(fontFamily: 'sen',fontSize: 20),),
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
