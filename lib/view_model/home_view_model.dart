import 'package:flutter/widgets.dart';
import 'package:mvvm_provider/data/response/api_response.dart';
import 'package:mvvm_provider/model/MovieListModel.dart';
import 'package:mvvm_provider/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{

  final homeRepository = HomeRepository();

  bool _loading = false;
  bool get loading => _loading;


  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());

    homeRepository.movieApi().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}