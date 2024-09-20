import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightdarktheme/Controller/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();  // Retrieve controller

    return Scaffold(
      appBar: AppBar(title: Text('Theme Switcher')),
      body: Center(
        child: Obx(() => SwitchListTile(
              title: Text(themeController.isDarkTheme.value ? 'Dark Mode' : 'Light Mode'),
              value: themeController.isDarkTheme.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            )),
      ),
    );
  }
}
