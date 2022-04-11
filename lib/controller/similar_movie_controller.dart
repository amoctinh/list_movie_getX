import 'package:flutter_list_movie/model/cast.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/model/movie_detail.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class SimilarController extends GetxController {
  var isLoading = true.obs;
  var movieList = <Movie>[].obs;
  final id;

  SimilarController(this.id);
  @override
  void onInit() {
    fetchListMovie(id);
    super.onInit();
  }
  Future fetchListMovie(int movieId) async {
    isLoading.value = true;
    try {
      final movies = await MovieRepository().getSimilarMovies(movieId);
      movieList.value = movies.movies;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
