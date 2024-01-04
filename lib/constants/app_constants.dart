
import 'package:flutter/material.dart';

class AppConstants{

  static final bottomNavBarItems = [
  const BottomNavigationBarItem(
    activeIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    activeIcon: Icon(Icons.group),
    icon: Icon(Icons.group_outlined),
    label: 'About',
  ),
];

static final List<List<Color>> colors = [
  [
  const Color.fromARGB(255, 0, 107, 194),
  const Color.fromARGB(255, 0, 61, 110)
  ],[
  const Color.fromARGB(255, 201, 184, 1),
  const Color.fromARGB(255, 255, 255, 0),
  ],
  [
  const Color.fromARGB(255, 194, 0, 3),
  const Color.fromARGB(255, 110, 0, 5)
  ],
];



static final List<String> icons = [
  "assets/icons/home1.png",
  "assets/icons/about.png",
  "assets/icons/settings.png",
];

static final List<String> titles = [
  "Home",
  "About",
  "Settings",
];

static final List<String> subtitles = [
  "Home screen allows to \nmanipulate lasers slides.",
  "Wanna know about how \nit works ??",
  "Configure IP and Port\nfor OSC connection."
];

}

