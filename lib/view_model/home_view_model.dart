import 'package:flutter/material.dart';
import 'package:ota/data/response/api_response.dart';
import 'package:ota/model/movie_model.dart';
import 'package:ota/repo/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  var timeNow = DateTime.now().hour;
  String message = '';
  greeting() {
    if (timeNow <= 12) {
      message = 'Good Morning';
      notifyListeners();
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good AfterNoon';
      notifyListeners();
    } else if ((timeNow > 16) && (timeNow <= 20)) {
      message = 'Good Evening';
      notifyListeners();
    } else {
      message = 'Good Night';
      notifyListeners();
    }
  }

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    movieList = response;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchMovieListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
