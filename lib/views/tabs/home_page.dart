import 'package:flutter/material.dart';
import 'package:laser_slides/widgets/slides_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(0),
          child: GridView.builder(
            itemCount: 18,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 6 : 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context,index){
              return CustomButton(index: index,);
            },
          ),
        )
      ),
    );
  }
}