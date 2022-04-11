import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/all_movie_controller.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/widgets/search_screen_widgets/search_list_horizontal.dart';
import 'package:get/get.dart';

class SearchMoviesList extends StatelessWidget {

  final AllMovieListController movieController = Get.put(AllMovieListController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Expanded(
            child: Obx(() {
              if (movieController.isLoading.value) {
                print('productController.isLoading.value :' +
                    movieController.isLoading.value.toString());
                return const Center(child: CircularProgressIndicator());
              } else {
                return SearchListHorizontal(
                  movies: movieController.movieList,
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
