import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lightdarktheme/Controller/theme_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Switcher',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        // Background Gradient for a more aesthetic look
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: themeController.isDarkTheme.value
                ? [Color(0xFF1F1C2C), Color(0xFF928DAB)]
                : [Color(0xFFe0eafc), Color(0xFFcfdef3)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Aesthetic animated card with smooth transitions
                Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            30), // Rounded corners for modern look
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: themeController.isDarkTheme.value
                                ? Colors.black54
                                : Colors.blueGrey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        },
                        child: Column(
                          key:
                              ValueKey<bool>(themeController.isDarkTheme.value),
                          children: [
                            Text(
                              themeController.isDarkTheme.value
                                  ? 'Dark Mode is ON'
                                  : 'Light Mode is ON',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(height: 20),
                            Switch(
                              value: themeController.isDarkTheme.value,
                              onChanged: (value) {
                                themeController.toggleTheme();
                              },
                              activeColor: Colors.blueAccent,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey[300],
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 40),
                // Elevated button with gradient and subtle shadow effect
                GestureDetector(
                  onTap: () {
                    // Add any action for this button
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: themeController.isDarkTheme.value
                            ? [Color(0xFF434343), Color(0xFF000000)]
                            : [Color(0xFF6dd5ed), Color(0xFF2193b0)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: themeController.isDarkTheme.value
                              ? Colors.black26
                              : Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      'Explore More',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
