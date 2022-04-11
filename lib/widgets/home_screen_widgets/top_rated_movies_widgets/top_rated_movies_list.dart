import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/top_rated_controller.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movie_widgets_loader.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class TopRatedMoviesList extends StatelessWidget {
  // final TopRateListController movieController = Get.put(TopRateListController());
  @override
  Widget build(BuildContext context) {
    return  GetX<TopRateListController>(
        init: TopRateListController(),
        builder: (movieController){
      if (movieController.isLoading.value) {
        print('MovieController.isLoading.value :' +
            movieController.isLoading.value.toString());
        return buildMovielistLoaderWidget(context);
        return const Center(child: CircularProgressIndicator());
      } else {
        return MoviesListTop(
          movies: movieController.movieList,
        );
      }
    });
  }
}

class MoviesListTop extends StatelessWidget {
  const MoviesListTop(
      {Key? key,
      required this.movies,})
      : super(key: key);

  final List<Movie> movies;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(MovieDetailScreen(
                      movieId: movies[index].id));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Stack(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.black87,
                            highlightColor: Colors.white54,
                            enabled: true,
                            child: const SizedBox(
                              height: 140.0,
                              child: AspectRatio(
                                  aspectRatio: 2 / 3,
                                  child: Icon(
                                    FontAwesome5.film,
                                    color: Colors.black26,
                                    size: 40.0,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 140.0,
                            child: AspectRatio(
                                aspectRatio: 2 / 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: FadeInImage.memoryNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: kTransparentImage,
                                      image:
                                          "https://image.tmdb.org/t/p/w300/" +
                                              movies[index].poster),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
