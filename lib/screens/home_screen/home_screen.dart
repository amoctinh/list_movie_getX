import 'dart:async';
import 'dart:io';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/style/theme_bloc/theme_controller.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movie_widgets_loader.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/now_playing_widgets/now_playing_list.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/popular_movies_widgets/popular_movies_list.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/top_rated_movies_widgets/top_rated_movies_list.dart';
import 'package:circular_menu/circular_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.themeController}) : super(key: key);

  final ThemeController themeController;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var h1 = false;
  final ScrollController _rrectController = ScrollController();

  void initState() {
    super.initState();
    loadDelay();
  }

  String _colorName = 'No';
  Color _color = Colors.black;

  Future<void> loadDelay() async {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        h1 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DraggableScrollbar.rrect(
            controller: _rrectController,
            backgroundColor: Colors.green,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // UpComingWidget(
                //     movieRepository: widget.movieRepository,
                //     themeController: widget.themeController),
                Container(
                  // color: Colors.green,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Center(
                      child: Text("Movie Ectrizz",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.green,
                            color: Colors.white,
                            fontSize: 22,
                          )),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text("TỔNG HỢP PHIM HOT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                        color: Colors.black,
                      )),
                ),
                TopRatedMoviesList(),
                NowPlayingList(),
                !h1
                    ? buildMovielistLoaderWidget(context)
                    : const PopularMoviesList(),
              ],
            ),
          ),
          CircularMenu(
            alignment: Alignment.bottomCenter,
            backgroundWidget: const Center(
              child: SizedBox(),
            ),
            toggleButtonSize: 25,
            toggleButtonColor: Colors.green,
            items: [
              CircularMenuItem(
                  icon: Icons.home,
                  color: Colors.green,
                  onTap: () {
                    setState(() {});
                  }),
              CircularMenuItem(
                  icon: Icons.search,
                  color: Colors.blue,
                  onTap: () {
                    setState(() {});
                  }),
              CircularMenuItem(
                  icon: Icons.settings,
                  color: Colors.orange,
                  onTap: () {
                    setState(() {});
                  }),
              CircularMenuItem(
                  icon: Icons.transit_enterexit,
                  color: Colors.purple,
                  onTap: () {
                    setState(() {});
                  }),
              CircularMenuItem(
                  icon: Icons.exit_to_app,
                  color: Colors.brown,
                  onTap: () {
                    _onTapExit(context);
                    setState(() {});
                  })
            ],
          ),
        ],
      ),
    );
  }

  _onTapExit(
    BuildContext context,
  ) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60,
                        child: const Center(
                          child: Text('Cảnh báo',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border:
                                Border.all(width: 1.0, color: Colors.black12)),
                      ),
                      const Center(
                        child: Text('Bạn có chắc chắn muốn Thoát !',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RaisedButton(
                              color: Colors.grey,
                              child: const Text('KO'),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog');
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: RaisedButton(
                              color: Colors.green,
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                exit(0);
                                // Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ));
        });
  }
}
