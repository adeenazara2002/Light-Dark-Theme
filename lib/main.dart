import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightdarktheme/Controller/theme_controller.dart';
import 'package:lightdarktheme/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());  // Initialize ThemeController

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
          themeMode: themeController.theme,  // Use theme from controller
          theme: themeController.lightTheme,  // Define light theme
          darkTheme: themeController.darkTheme,  // Define dark theme
          home: HomeScreen(),
        ));
  }
}
