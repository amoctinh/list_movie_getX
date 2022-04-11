import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/genres_by_movie.dart';
import 'package:flutter_list_movie/model/genre.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movie_widgets_loader.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movies_grid_list_horizontal.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'package:get/get.dart';

class GenreMovieList extends StatelessWidget {
  const GenreMovieList(
      {Key? key,
        required this.genre})
      : super(key: key);
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return  GenreMovieView(
      genre: genre,
    );
  }
}

class GenreMovieView extends StatelessWidget {
  const GenreMovieView(
      {Key? key,
        required this.genre})
      : super(key: key);
  final Genre genre;
  @override
  Widget build(BuildContext context) {
    final GenresByMovieController movieController = Get.put(GenresByMovieController(genre));
    return Obx(() {
      if (movieController.isLoading.value) {
        print('MovieController.isLoading.value :' +
            movieController.isLoading.value.toString());
        return buildMovielistLoaderWidget(context);
        // return const Center(child: CircularProgressIndicator());
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Thể loại ** ${genre.name}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: MoviesGridListHorizontal(
            movies: movieController.movieList,
          ),
        );
      }

    }
    );
  }
}
