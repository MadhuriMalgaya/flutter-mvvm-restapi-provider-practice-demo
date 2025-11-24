import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/model/UserModel.dart';
import 'package:mvvm_provider/repository/auth_repository.dart';
import 'package:mvvm_provider/utils/routes/route_name.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    setLoading(true);
    
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString()
        )
      );
      Utils.toastMessage("Login Successfully");
      Navigator.pushNamed(context, RouteName.home);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, error.toString());
        print(error.toString());
      }
    });
  }

  Future <void> registerApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _myRepo.registerApi(data).then((value){
      setLoading(false);
      Utils.toastMessage("Register Successfully");
      Navigator.pushNamed(context, RouteName.home);

      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error , stackTrace){
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, error.toString());
        print(error.toString());
      }
    });
  }
}