import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:painter_class/view/home_screen.dart';

void main()
{
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(p0) => const HomeScreen()
    },
  ));
}