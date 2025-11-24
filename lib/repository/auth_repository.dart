import 'dart:io';
import 'package:mvvm_provider/data/app_exception.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_provider/res/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);

      return response;
    }
    on SocketException{
      throw FetchDataException();
    }
  }

  Future<dynamic> registerApi(dynamic data) async{
    try{
      final response = _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}