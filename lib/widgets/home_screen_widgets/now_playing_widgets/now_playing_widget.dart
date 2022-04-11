import 'package:flutter/material.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'now_playing_list.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget(
      {Key? key,
        required this.movies,})
      : super(key: key);
  final List<Movie> movies;
  @override
  _NowPlayingWidgetState createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách phim nổi bật",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: MoviesListHorizontal(
        movies: widget.movies,
      ),
    );
  }
}
