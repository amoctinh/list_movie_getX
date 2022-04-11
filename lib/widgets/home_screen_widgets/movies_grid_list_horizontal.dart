import 'package:flutter/material.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviesGridListHorizontal extends StatelessWidget {
  const MoviesGridListHorizontal(
      {Key? key,
      required this.movies,})
      : super(key: key);

  final List<Movie> movies;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 700,
        child: GridView.count(
         // scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(movies.length, (index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0, left: 8.0, top: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(MovieDetailScreen(
                        movieId: movies[index].id));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0)),
                          child: Stack(
                            children: [
                              Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.black87,
                                  highlightColor: Colors.white54,
                                  enabled: true,
                                  child: const SizedBox(
                                    height: 160.0,
                                    child: Icon(
                                      FontAwesome5.film,
                                      color: Colors.black26,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 200.0,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: FadeInImage.memoryNetwork(
                                            fit: BoxFit.cover,
                                            placeholder: kTransparentImage,
                                            image:
                                                "https://image.tmdb.org/t/p/w300/" +
                                                    movies[index].poster),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0)),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.black87,
                                                  highlightColor:
                                                      Colors.white54,
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
                                              SizedBox(
                                                height: 40.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5.0),
                                                  child: Center(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius.circular(
                                                                      30.0)),
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.1)),
                                                      child: Expanded(
                                                        child: Center(
                                                          child: Text(

                                                            movies[index]
                                                                .title,
                                                            // maxLines: 2,
                                                            textAlign: TextAlign.center,
                                                            style: const TextStyle(

                                                                height: 1.4,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    9.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })));
  }
}
