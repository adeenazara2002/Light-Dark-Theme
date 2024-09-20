import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightdarktheme/homeScreen.dart';
import 'Controller/theme_controller.dart';  // Import your ThemeController

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());  // Initialize controller

  @override
  Widget build(BuildContext context) {
    
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
          themeMode: themeController.theme,  // Use theme from controller
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blueGrey,
          ),
          home: HomeScreen(),
        ));
  }
}
