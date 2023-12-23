import 'package:hive/hive.dart';

part 'slide.g.dart';

@HiveType(typeId: 1)
class Slide {

  Slide({
    required this.label,
    required this.command
  });

  @HiveField(0)
  String label = "slide1";

  @HiveField(1)
  String command = '0 1';

}