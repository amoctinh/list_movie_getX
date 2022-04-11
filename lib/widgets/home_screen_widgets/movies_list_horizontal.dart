import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

import 'movie_widgets_loader.dart';

class MoviesListHorizontal extends StatefulWidget {
  const MoviesListHorizontal(
      {Key? key,
      required this.movies, this.lenght,})
      : super(key: key);
  final List<Movie> movies;
  final int? lenght;

  @override
  State<MoviesListHorizontal> createState() => _MoviesListHorizontalState();
}

class _MoviesListHorizontalState extends State<MoviesListHorizontal> {
  String? outputDate = "";
  var inputFormat = DateFormat('yyyy-MM-dd');
  var outputFormat = DateFormat('dd-MM-yyyy');
  late VideoPlayerController _controller;

  int i = 0;



  @override
  void initState() {
    super.initState();
    _controller =VideoPlayerController.asset("");
    // Future.delayed(const Duration(seconds: 3), () {
    //   _controller = VideoPlayerController.asset("assets/intro/introxoay.mp4"
    //     // "https://amt2020.000webhostapp.com/intro/introhud.mp4"
    //   )
    //     ..initialize().then((_) {
    //       _controller.play();
    //       _controller.setLooping(true);
    //       setState(() {});
    //     });
    // });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        i = 1;
      });
    });

  }



  final ScrollController rrectController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SizedBox.expand(
        //   child: FittedBox(
        //     fit: BoxFit.fill,
        //     child: SizedBox(
        //       width: _controller.value.size.width,
        //       height: _controller.value.size.height,
        //       child: VideoPlayer(_controller),
        //     ),
        //   ),
        // ),

        i == 0
            ? Column(
          children: [
            buildMovielistLoaderWidget(context),
            const Center(child: CircularProgressIndicator())
          ],
        )
            :
        SizedBox(
            height: 1000,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: (widget.lenght == null)
                    ?widget.movies.length:widget.lenght,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5.0, left: 30.0, top: 5.0, right: 30.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(MovieDetailScreen(
                            movieId: widget.movies[index].id));
                      },
                      child: ListTile(
                        title: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  width: 4.0, color: Colors.white30)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      border: Border.all(
                                          width: 5.0, color: Colors.black12)),
                                  // height: 80.0,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: FadeInImage.memoryNetwork(
                                              fit: BoxFit.cover,
                                              placeholder:
                                                  kTransparentImage,
                                              image:
                                                  "https://image.tmdb.org/t/p/w300/" +
                                                      widget.movies[index]
                                                          .poster),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.black87,
                                          highlightColor: Colors.white54,
                                          enabled: true,
                                          child: const SizedBox(
                                            child: Icon(
                                              FontAwesome5.film,
                                              color: Colors.black26,
                                              size: 40.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 100.0,
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 15),
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5.0),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        30.0)),
                                                            color: Colors
                                                                .white
                                                                .withOpacity(
                                                                    0.1)),
                                                        child: Expanded(
                                                          child: Center(
                                                            child: Text(
                                                              widget
                                                                  .movies[
                                                                      index]
                                                                  .title,
                                                              maxLines: 2,
                                                              style: const TextStyle(
                                                                  height: 1.4,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      12.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            outputFormat.format(
                                              inputFormat.parse(widget
                                                  .movies[index].releaseDate),
                                            ),
                                            // widget.movies[index].releaseDate,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                height: 1.4,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // subtitle: Text('\$${suggestion['image']}'),
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
