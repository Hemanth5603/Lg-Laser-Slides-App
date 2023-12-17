import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: w,
                height: h *0.2,
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/about.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              )
            ],
          ),
        )

      ),
    );
  }
}