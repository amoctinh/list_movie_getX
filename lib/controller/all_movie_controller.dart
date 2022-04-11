import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/model/movie_response.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class AllMovieListController extends GetxController {
  var isLoading = true.obs;
  var movieList = <Movie>[].obs;
  var list = <Movie>[].obs;

  @override
  void onInit() {
    fetchListMovie();
    super.onInit();
  }

  Future fetchListMovie() async {
    isLoading.value = true;
    try {
      for (int i = 1; i <= 10; i++) {
        final movies = await MovieRepository().getTopRatedMovies(i);
        list = list + movies.movies;
        print("QQQQQQQQQQQQQQ:  " + list.length.toString());
      }
      print("tổng :  " + list.length.toString());
      movieList.value = list;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}

