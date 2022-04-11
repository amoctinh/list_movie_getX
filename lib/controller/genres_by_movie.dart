import 'package:flutter_list_movie/model/genre.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class GenresByMovieController extends GetxController {
  var isLoading = true.obs;
  var movieList = <Movie>[].obs;
  final Genre genre;

  GenresByMovieController(this.genre);
  @override
  void onInit() {
    fetchListMovie(genre.id);
    super.onInit();
  }
  Future fetchListMovie( int genreId) async {
    isLoading.value = true;
    try {
      final movies = await MovieRepository().getMovieByGenre(genreId);
      movieList.value = movies.movies;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
