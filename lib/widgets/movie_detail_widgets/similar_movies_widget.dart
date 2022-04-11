import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/similar_movie_controller.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movie_similar_list.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'package:get/get.dart';


class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget(
      {Key? key,
        required this.movieId,
        })
      : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final SimilarController movieController = Get.put(SimilarController(movieId));
    return Obx(() {
      if (movieController.isLoading.value) {
        print('MovieController.isLoading.value :' +
            movieController.isLoading.value.toString());
        return const Center(child: CircularProgressIndicator());
      } else {
        return Similar_List(
          movies: movieController.movieList,lenght: 6,
        );
      }
    });
  }
}
