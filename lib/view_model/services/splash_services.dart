import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/model/UserModel.dart';
import 'package:mvvm_provider/utils/routes/route_name.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async{

      print(value.token.toString());
      if(value.token == "null" || value.token!.isEmpty ){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RouteName.login);
      }
      else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RouteName.home);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}