import 'package:flutter/material.dart';
import 'package:flutter_list_movie/model/genre.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';

import 'genre_movie_list.dart';

class GenreMovieListWidget extends StatefulWidget {
  const GenreMovieListWidget(
      {Key? key,
      required this.genre})
      : super(key: key);
  final Genre genre;

  @override
  _GenreMovieListWidgetState createState() => _GenreMovieListWidgetState();
}

class _GenreMovieListWidgetState extends State<GenreMovieListWidget> {
  @override
  Widget build(BuildContext context) {
    return GenreMovieList(
        genre: widget.genre,
    );
  }
}
