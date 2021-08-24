import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/home/home_page.dart';
import 'package:flutter_demo/model/LoginResponse.dart';
import 'package:flutter_demo/model/LoginUser.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/authentication/bloc/sign_in_bloc.dart';
import 'package:flutter_demo/ui/authentication/bloc/sign_in_event.dart';
import 'package:flutter_demo/ui/authentication/bloc/sign_in_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(SignInInitialState()),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            //TODO: Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
          }
          if (state is SignInFailureState) {
            // TODO: show some toast message

          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SignInInitialState) {
              return Scaffold(
                // resizeToAvoidBottomInset: false,
                body: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: loginEmailController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          fillColor: Colors.white12,
                          hintText: ' Mobile Number',
                          prefixIcon: Icon(Icons.phone_outlined),
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                            borderSide: BorderSide(color: Colors.grey[400], width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                            borderSide: BorderSide(color: Colors.deepPurple[200], width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: loginPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white12,
                          hintText: 'Password ',
                          prefixIcon: Icon(Icons.lock_open),
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                            borderSide: BorderSide(color: Colors.grey[400], width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                            borderSide: BorderSide(color: Colors.deepPurple[200], width: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: (() {
                              setState(() {
                                if (loginEmailController.text.toString().isEmpty) {
                                  // _showToast(context);
                                  Fluttertoast.showToast(
                                      msg: "User Name is Empty",
                                      toastLength: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.grey[400],
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (loginPasswordController.text.toString().isEmpty) {
                                  // _showToast(context);

                                  Fluttertoast.showToast(
                                      msg: "Password is empty",
                                      toastLength: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.grey[400],
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  // TODO: Add SignInEvent
                                  BlocProvider.of<SignInBloc>(context).add(SignInEvent(
                                      userName: loginEmailController.text.toString(),
                                      password: loginPasswordController.text.toString()));
                                  // getUserInfo();
                                }
                              });
                            }),
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              );
            } else if(state is SignInLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text('No State'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<LoginResponse> getUserInfo() async {
    /* Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return
        Center(
          child: CircularProgressIndicator(),

      );
    }));*/
    try {
      var client = DigestAuthClient(loginEmailController.text.toString(), loginPasswordController.text.toString());

      final url = Uri.parse('https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/merchant/authentication');

      final response = await client.get(url);

      final decodedJson = json.decode(response.body);

      print("Login response is ${decodedJson}");

      if (response.statusCode == 200) {
        print("login success");
        final user = LoginResponse.fromJson(decodedJson);

        Map jsonLoginUser = user.loginUser.toJson();

        String mLoginUser = jsonEncode(LoginUser.fromJson(jsonLoginUser));

        SharedPreferences preferences = await SharedPreferences.getInstance();

        preferences.setString("Key_UserName", loginEmailController.text.toString());

        preferences.setString("Key_Password", loginPasswordController.text.toString());

        preferences.setString("Key_Login_Details", mLoginUser);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e, stackTrace) {
      print('Exception: $e \n $stackTrace');
    } finally {
      // Navigator.pop(context);
    }
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
