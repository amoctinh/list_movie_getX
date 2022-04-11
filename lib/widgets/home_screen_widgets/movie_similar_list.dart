
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

import 'movie_widgets_loader.dart';

class Similar_List extends StatefulWidget {
  const Similar_List({
    Key? key,
    required this.movies,
    this.lenght,
  }) : super(key: key);
  final List<Movie> movies;
  final int? lenght;

  @override
  State<Similar_List> createState() => _Similar_ListState();
}

class _Similar_ListState extends State<Similar_List> {
  // final PopularListController movieController = Get.put(PopularListController());
  int i = 0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        i = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child:
      (widget.lenght == null)
          ? Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Danh sách phim xem ngay",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: i == 0
                  ? Column(
                      children: [
                        buildMovielistLoaderWidget(context),
                        const Center(child: CircularProgressIndicator())
                      ],
                    )
                  : StaggeredGridView.countBuilder(
                      crossAxisCount: 3,
                      itemCount: widget.movies.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return MovieTile(widget.movies[index]);
                      },
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                    ),
            )
          : StaggeredGridView.countBuilder(
              crossAxisCount: 3,
              itemCount: widget.lenght,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return MovieTile(widget.movies[index]);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
    );
  }
}

class MovieTile extends StatelessWidget {
  final Movie movie;

  MovieTile(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(MovieDetailScreen(movieId: movie.id));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(width: 5.0, color: Colors.black12)),
                      child: Center(
                        child: Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: FadeInImage.memoryNetwork(
                                fit: BoxFit.cover,
                                placeholder: kTransparentImage,
                                image: "https://image.tmdb.org/t/p/w300/" +
                                    movie.poster),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    color: Colors.green,
                    icon: const Icon(Icons.star),
                    // icon: product.isFavorite.value
                    //     ? Icon(Icons.favorite_rounded)
                    //     : Icon(Icons.favorite_border),
                    onPressed: () {
                      // product.isFavorite.toggle();
                    },
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
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
                    SizedBox(
                      height: 40.0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              color: Colors.white.withOpacity(0.1)),
                          child: Expanded(
                            child: Center(
                              child: Text(
                                movie.title,
                                // maxLines: 2,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    height: 1.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9.0),
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
    );
  }
}
