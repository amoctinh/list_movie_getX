import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/genres_controller.dart';
import 'package:flutter_list_movie/widgets/genres_screen_widgets/genres_list_horizontal.dart';
import 'package:get/get.dart';

class GenresListScreen extends StatelessWidget {
  final GenresController movieController = Get.put(GenresController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (movieController.isLoading.value) {
        print('GenresController.isLoading.value :' +
            movieController.isLoading.value.toString());
        return const Center(child: CircularProgressIndicator());
      } else {
        return GenresListHorizontal(
         genres: movieController.genreList,
        );
      }
    });
  }
}
