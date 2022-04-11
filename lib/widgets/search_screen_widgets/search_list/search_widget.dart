import 'package:flutter/material.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:flutter_list_movie/widgets/search_screen_widgets/search_list/search_list.dart';

class SearchWidget extends StatefulWidget {


  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchMoviesList(
    );
  }
}
