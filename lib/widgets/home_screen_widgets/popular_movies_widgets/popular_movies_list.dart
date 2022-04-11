import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/popular_movie_controller.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movie_similar_list.dart';
import 'package:get/get.dart';

import '../movie_widgets_loader.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GetX<PopularListController>(
        init: PopularListController(),
          builder: (movieController){
            if (movieController.isLoading.value) {
              print('MovieController.isLoading.value :' +
                  movieController.isLoading.value.toString());
              return buildMovielistLoaderWidget(context);
              // return const Center(child: CircularProgressIndicator());
            } else {
              return
                Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text("XEM NGAY !",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.white,
                                  color: Colors.black,
                                ))),
                        InkWell(
                          onTap: () {
                            Get.to(Similar_List(movies: movieController.movieList));
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
                    padding: const EdgeInsets.fromLTRB(30, 1, 30, 1),
                    child: SizedBox(
                        height: 600,
                        child: Similar_List( movies: movieController.movieList,lenght: 6,)),
                  )
                  ],
                );
            }}
      );
  }
}
