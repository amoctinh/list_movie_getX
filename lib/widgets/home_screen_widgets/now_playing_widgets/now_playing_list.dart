import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/movie_controller.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movie_widgets_loader.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movies_grid_list_horizontal.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'package:get/get.dart';

import 'now_playing_widget.dart';

class NowPlayingList extends StatelessWidget {
  // final MovieController movieController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return GetX<MovieController>(
        init: MovieController(),
        builder: (movieController){
      if (movieController.isLoading.value) {
        print('MovieController.isLoading.value :' +
            movieController.isLoading.value.toString());
        return buildMovielistLoaderWidget(context);
        return const Center(child: CircularProgressIndicator());
      } else {
        return Column(
          children: [


            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(" PHIM NỔI BẬT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white,
                          color: Colors.black,
                        ))),
                InkWell(
                  onTap: () {
                    Get.to(NowPlayingWidget(
                      movies: movieController.movieList,
                    ));
                  },
                  child: const SizedBox(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 300,
                child:  MoviesListHorizontal(
                  movies: movieController.movieList,lenght: 3,
                ),
              ),
            ),

          ],
        );
        }
    });
  }
}
