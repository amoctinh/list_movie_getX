import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class UpComingListController extends GetxController {
  var isLoading = true.obs;
  var movieList = <Movie>[].obs;
  @override
  void onInit() {
    fetchListMovie();
    super.onInit();
  }
  Future fetchListMovie() async {
    isLoading.value = true;
    try {
      final movies = await MovieRepository().getUpcomingMovies();
      print('Person......'+movies.toString());
      movieList.value = movies.movies;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
