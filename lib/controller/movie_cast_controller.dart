import 'package:flutter_list_movie/model/cast.dart';
import 'package:flutter_list_movie/model/movie.dart';
import 'package:flutter_list_movie/repositories/movie_repository.dart';
import 'package:get/state_manager.dart';

class MovieCastController extends GetxController {
  var isLoading = true.obs;
  var castList = <Cast>[].obs;
  final id;

  MovieCastController(this.id);
  @override
  void onInit() {
    fetchListMovie(id);
    super.onInit();
  }
  Future fetchListMovie(int movieId) async {
    isLoading.value = true;
    try {
      final cast = await MovieRepository().getCasts(movieId);
      castList.value = cast.casts;
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
