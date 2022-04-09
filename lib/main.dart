import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'bloc/theme_bloc/theme_controller.dart';
import 'bloc/theme_bloc/theme_service.dart';
import 'repositories/movie_repository.dart';

// var routes = <String, WidgetBuilder>{
//   "/home": (BuildContext context) => HomeScreen(),
//   "/intro": (BuildContext context) => IntroScreen(),
// };

void main() => runApp(new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    // routes: routes
));


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();

    final movieRepository = MovieRepository();
    final themeController = ThemeController(ThemeService());
    await themeController.loadSettings();
    // runApp(App(
    //   themeController: themeController,
    //   movieRepository: movieRepository,
    // ));
    Timer(Duration(seconds: 5), () =>
        Get.put(App(
      themeController: themeController,
      movieRepository: movieRepository,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Movie Ectrizz",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "Online",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}




// void main() async {
//   final movieRepository = MovieRepository();
//   final themeController = ThemeController(ThemeService());
//   await themeController.loadSettings();
//   runApp(App(
//     themeController: themeController,
//     movieRepository: movieRepository,
//   ));
// }
