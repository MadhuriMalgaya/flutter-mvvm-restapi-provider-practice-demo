import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils{

  static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i= 0; i<rating.length; i++){
      avgRating= avgRating+rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }
   static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP);
  }

  static flushBarErrorMessage(BuildContext context, String message ){
     showFlushbar(context: context,
         flushbar: Flushbar(
           message: message,
           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           padding: EdgeInsets.all(15),
           borderRadius: BorderRadius.circular(10),
           flushbarPosition: FlushbarPosition.TOP,
           backgroundColor: Colors.red,
           titleColor: Colors.white,
           forwardAnimationCurve: Curves.decelerate,
           icon: Icon(Icons.error, size: 28, color: Colors.white,),
           duration: Duration(seconds: 3),
         )..show(context)
     );
  }
  
  static snackBar(BuildContext context, String message){
     return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(message))
     );
  }

  static void focusNode(FocusNode current, FocusNode nextFocus, BuildContext context){
     current.unfocus();
     FocusScope.of(context).requestFocus(nextFocus);
   }
}