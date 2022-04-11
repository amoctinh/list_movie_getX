import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/style/theme_bloc/theme_controller.dart';
import 'package:get/get.dart';
import 'helpers.dart';
import 'repositories/movie_repository.dart';
import 'screens/main_screen.dart';
import 'style/custom_theme.dart';

// class App extends StatelessWidget {
//   const App(
//       {Key? key, required this.themeController,})
//       : super(key: key);
//   final ThemeController themeController;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: themeController,
//       builder: (BuildContext context, Widget? child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: CustomTheme.lightTheme,
//           darkTheme: CustomTheme.darkTheme,
//           themeMode: themeController.themeMode,
//           home: MainScreen(themeController: themeController,),
//         );
//       },
//     );
//   }
// }



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 5), () =>
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => MainScreen(
    //         themeController: widget.themeController,
    //         movieRepository: widget.movieRepository,
    //       )),
    //     ),
    // );
    checkBoxCallBack(isOnline);
  }


  var isOnline = true;
  String check="Online";
  Future<void> checkBoxCallBack(bool checkBoxState) async {
    var isChecked = await verifyOnline();
    print("kkkk $isChecked");
    setState(() {
      isOnline = isChecked;
    });
    if (!isOnline) {
      setState(() {
        check="KO INTERNET";
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Không có kết nối Internet!")));
    }
    check="Online";
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng chờ trong giây lát!")));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.movie,
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
                    const CircularProgressIndicator(color: Colors.white,),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 1.0, color: Colors.white)),
                      child:
                      isOnline
                          ?
                      Text(
                        check,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            backgroundColor: Colors.white,
                            color: Colors.lightBlue),
                      ):
                      Text(
                        check,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            backgroundColor: Colors.white,
                            color: Colors.lightBlue),
                      ),
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



