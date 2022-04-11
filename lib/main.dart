import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_list_movie/style/theme_bloc/theme_controller.dart';
import 'package:flutter_list_movie/style/theme_bloc/theme_service.dart';
import 'package:get/get.dart';
import 'screens/main_screen.dart';
import 'style/custom_theme.dart';

void main() async {
  final themeController = ThemeController(ThemeService());
  await themeController.loadSettings();
  runApp(App(
    themeController: themeController,
  ));
}

class App extends StatelessWidget {
  const App(
      {Key? key, required this.themeController,})
      : super(key: key);
  final ThemeController themeController;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
          darkTheme: CustomTheme.darkTheme,
          themeMode: themeController.themeMode,
          builder: EasyLoading.init(),
          home: MainScreen(themeController: themeController,),
        );
      },
    );
  }
}