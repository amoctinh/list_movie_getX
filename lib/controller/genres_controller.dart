import 'package:flutter_list_movie/model/genre.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class GenresController extends GetxController {
  var isLoading = true.obs;
  var genreList = <Genre>[].obs;
  @override
  void onInit() {
    fetchListGenres();
    super.onInit();
  }
  Future fetchListGenres() async {
    isLoading.value = true;
    try {
      final genres = await MovieRepository().getGenres();
      genreList.value = genres.genres;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
