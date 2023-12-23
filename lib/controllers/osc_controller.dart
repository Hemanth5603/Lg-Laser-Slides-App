import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osc/osc.dart';

class OSCController extends GetxController{

  final incomingIpController = TextEditingController();
  final outgoingIpController = TextEditingController();
  final outPortController = TextEditingController();
  final startPathController = TextEditingController();
  final inPortController = TextEditingController();
  
  final buttonLabelController = TextEditingController();
  final commandController = TextEditingController();
  final buttonReleasedController = TextEditingController();

  // Creating a client to connect with Beyond
  late InternetAddress address = InternetAddress(outgoingIpController.text);
  late final client = OSCSocket(destination: address,destinationPort: int.parse(outPortController.text));
  
  // send commands to beyond
  void sendMessage(command){
    final message = OSCMessage('/beyond/general/startcue',
      arguments: [
        int.parse(command.toString().substring(0,1)),
        int.parse(command.toString().substring(2,3))
      ]); 
    client.send(message);
  }
}