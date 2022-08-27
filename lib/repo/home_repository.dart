import 'package:ota/model/movie_model.dart';
import 'package:ota/utils/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
