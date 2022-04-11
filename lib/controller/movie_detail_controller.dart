import 'package:flutter_list_movie/model/cast.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/model/movie_detail.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class MovieDetailController extends GetxController {
  var isLoading = true.obs;
 late MovieDetail m;
  final id;

  MovieDetailController(this.id);
  @override
  void onInit() {
    fetchListMovie(id);
    super.onInit();
  }
  Future fetchListMovie(int movieId) async {
    isLoading.value = true;
    try {
      final movie = await MovieRepository().getMovieDetail(movieId);
   m = movie.movieDetail;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
