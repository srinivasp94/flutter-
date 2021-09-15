import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/home/home_page.dart';
import 'package:flutter_demo/ui/authentication/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_demo/ui/authentication/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_demo/ui/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter_demo/ui/authentication/splash_screen.dart';
import 'package:flutter_demo/ui/authentication/stackover.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(create: (context) => SignInBloc(SignInInitialState())),
        BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(SignUpInitial())),
      ],
      child: MaterialApp(
        home: StackOver(),
        // home: SplashScreen(),
      ),
    );
  }
}

const double width = 300.0;
const double height = 50.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.grey;

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  double xAlign;
  Color loginColor;
  Color signInColor;

  @override
  void initState() {
    super.initState();

    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/app_background.png',
                  ),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/app_logo.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Getting Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontFamily: 'fonts/Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Expanded(
                          flex: 2,
                          child: Container(
                              alignment: Alignment.topCenter,
                              height: 300.0,
                              width: double.infinity,
                              child: Card(
                                elevation: 6.0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    AnimatedAlign(
                                      alignment: Alignment(xAlign, 0),
                                      duration: Duration(milliseconds: 300),
                                      child: Container(
                                        width: width * 0.5,
                                        height: height,
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          xAlign = loginAlign;
                                          loginColor = selectedColor;

                                          signInColor = normalColor;
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment(-1, 0),
                                        child: Container(
                                            width: width * 0.5,
                                            color: Colors.transparent,
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                  color: loginColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          xAlign = signInAlign;
                                          signInColor = selectedColor;

                                          loginColor = normalColor;
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment(1, 0),
                                        child: Container(
                                            width: width * 0.5,
                                            color: Colors.transparent,
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Text(
                                                'Signin',
                                                style: TextStyle(
                                                  color: signInColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ))
                  ],
                ))));
  }
}
