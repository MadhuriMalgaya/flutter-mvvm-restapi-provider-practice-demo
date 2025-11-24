import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/color.dart';

class RoundButton extends StatelessWidget {


  String title;
  bool loading;
  VoidCallback onPress;

  RoundButton({super.key,
    required this.title,
    this.loading = false,
    required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: loading ?CircularProgressIndicator():
           Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(title, style: TextStyle(color: AppColors.whiteColor),)),
      ),
    );
  }
}
