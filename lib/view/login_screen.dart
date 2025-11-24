import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/components/round_button.dart';
import 'package:mvvm_provider/utils/routes/route_name.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  ValueNotifier<bool> visibilityToggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextFormField(
                controller: usernameController,
                focusNode: emailFocus,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  label: Text("UserName"),
                  hintText: "username", hintStyle: TextStyle(color: Colors.grey)
                ),
                onFieldSubmitted: (value){
                  Utils.focusNode(emailFocus, passwordFocus, context);
                },
              ),
              SizedBox(height: 20,),
              ValueListenableBuilder(
                  valueListenable: visibilityToggle,
                  builder: (context, value, child){
                    return TextFormField(
                      controller: passwordController,
                      obscureText: value,
                      focusNode: passwordFocus,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: (){
                              visibilityToggle.value = !value;
                            },
                              child: Icon(value? Icons.visibility_off : Icons.visibility)),
                          label: Text("Password"),
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.grey)
                      ),
                    );
                  }),
              SizedBox(height: 30,),
              RoundButton(title: "Login",
                  loading: authViewModel.loading,
                  onPress: (){
                if(usernameController.text.isEmpty){
                  Utils.flushBarErrorMessage(context, "Please type your Email first");
                }
                else if(passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage(context, "Please type your password first");
                }
                else if(passwordController.text.length <= 6){
                  Utils.flushBarErrorMessage(context, "your password length is 6 or more than 6");
                }
                else{
                  Map data ={
                    'username': usernameController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  authViewModel.loginApi(data, context);

                  print("login");
                }
              }),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RouteName.register);
                },
                  child: Text("Don't have an account? Sign Up"))
            ],
          ))
    );
  }
}
