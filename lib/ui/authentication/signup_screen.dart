import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/home/home_page.dart';
import 'package:flutter_demo/ui/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController signupNameController = TextEditingController();

  TextEditingController signuppasswordController = TextEditingController();

  TextEditingController signupEmailController = TextEditingController();

  TextEditingController signupMobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => SignUpBloc(SignUpInitial()),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if(state is SignUpSuccessState) {
              // TODO: implement navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
            } else {
              Fluttertoast.showToast(
                  msg: "Sign In Failed",
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: Colors.grey[400],
                  textColor: Colors.white,
                  fontSize: 16.0,
              );
            }
          },
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  runSpacing: 16,
                  children: <Widget>[
                    TextField(
                      controller: signupNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: Colors.white12,
                        hintText: 'User Name ',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.grey[400],
                        ),
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.grey[200], width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.deepPurple[200], width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: signupEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.white12,
                        hintText: 'Email ',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey[400],
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.grey[200], width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.deepPurple[200], width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: signupMobileController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: Colors.white12,
                        hintText: ' Mobile Number',
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: Colors.grey[400],
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.grey[200], width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.deepPurple[200], width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: signuppasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Colors.white12,
                        hintText: 'Password ',
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.grey[400],
                        ),
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.grey[200], width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide:
                          BorderSide(color: Colors.deepPurple[200], width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "By pressing Submit you agree to \n terms & Conditions",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: (() {

                              String userName = signupNameController.text.trim();
                              String emailId = signupEmailController.text.trim();
                              String mobile = signupMobileController.text.trim();
                              String password = signuppasswordController.text.trim();

                              BlocProvider.of<SignUpBloc>(context).add(RegisterEvent(userName: userName, emailId: emailId, mobile: mobile, password: password));
                            /*  setState(() {
                                validateRegisterForm();
                              });*/
                            }),
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      )
    );
  }
}
