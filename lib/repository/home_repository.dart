import 'dart:io';

import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_provider/model/MovieListModel.dart';
import 'package:mvvm_provider/res/app_url.dart';

import '../data/app_exception.dart';

class HomeRepository{

  BaseApiServices services = NetworkApiServices();

  Future<MovieListModel> movieApi() async{
    try{
      dynamic response = await services.getGetApiResponse(AppUrl.movieUrl);
      return response = MovieListModel.fromJson(response);
    }
    catch(e){
      throw e;
    }
  }
}