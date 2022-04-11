import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/movie_cast_controller.dart';
import 'package:get/get.dart';
import '../../repositories/movie_repository.dart';
import 'casts_list_horizontal.dart';


class MovieCasts extends GetWidget {

 MovieCasts(
      {Key? key,
      required this.movieId,})
      : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final MovieCastController movieController = Get.put(MovieCastController(movieId));
    return Obx(() {
      if (movieController.isLoading.value) {
        print('MovieController.isLoading.value :' +
            movieController.isLoading.value.toString());
        return const Center(child: CircularProgressIndicator());
      } else {
        return
          CastsListHorizontal(
            casts: movieController.castList,

          );
        //   Container(
        //   decoration: BoxDecoration(
        //     // shape: BoxShape.circle,
        //     border: Border.all(
        //       color: Colors.grey,
        //     ),
        //     image: DecorationImage(
        //       // fit: BoxFit.fill,
        //         image: AssetImage("assets/logo.jpg")),
        //   ),
        // );

      }
    }
    );
  }
}
