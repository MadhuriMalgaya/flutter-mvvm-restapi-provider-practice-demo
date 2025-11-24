import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/route_name.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import 'package:mvvm_provider/view/login_screen.dart';
import 'package:mvvm_provider/view/signup_screen.dart';
import 'package:mvvm_provider/view/splash_view.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings setting){

    switch(setting.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (context)=> HomeScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (context)=> LoginScreen());

      case RouteName.register:
        return MaterialPageRoute(builder: (context) => SignupScreen());

      case RouteName.splash:
        return MaterialPageRoute(builder: (context)=> SplashView());
      default:
         return MaterialPageRoute(builder: (context) {
           return Scaffold(
             body: Center(
               child: Text("No Route"),
             ),
           );
         });
    }
  }
}