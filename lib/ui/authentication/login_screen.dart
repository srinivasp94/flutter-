import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/LoginResponse.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreenApp extends StatefulWidget {
  @override
  _LoginScreenAppState createState() => _LoginScreenAppState();
}

class _LoginScreenAppState extends State<LoginScreenApp> {

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String mUserName = '';

  String mPassword = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/app_background.png'),
          fit: BoxFit.cover,
        )),

          child: new Padding(
            padding: new EdgeInsets.all(25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: usernameController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter User Name',

                    ),
                    onChanged: (text) {
                      setState(() {
                        mUserName = text;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (text) {
                      setState(() {
                        mPassword = text;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    child: Text('Login'),
                    textColor: Colors.white,
                    color: Colors.lightBlue,
                    elevation: 5,
                    onPressed: () {
                      setState(() {
                        if (usernameController.text.toString().isEmpty) {
                          // _showToast(context);
                          Fluttertoast.showToast(
                              msg: "User Name is Empty",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.grey[400],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (passwordController.text.toString().isEmpty) {
                          // _showToast(context);

                          Fluttertoast.showToast(
                              msg: "Password is empty",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.grey[400],
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          var client = DigestAuthClient(
                              usernameController.text.toString(),
                              passwordController.text.toString());

                          final url = Uri.parse(
                              'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/merchant/authentication');

                          client.get(url).then((r) => {print(r.body)});

                          // getUserInfo();
                        }
                      });
                    },
                  ),
                ]),
          ),
      ),
    )));
  }

  Future<LoginResponse> getUserInfo() async {
    var client = DigestAuthClient(
        usernameController.text.toString(), passwordController.text.toString());

    print(usernameController.text.toString() + " - " + passwordController.text.toString());


    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/merchant/authentication');

    // LoginResponse loginResponse;
    final response = await client.get(url);

    print(response.statusCode);
    print(response.body.toString());
    if (response.statusCode == 200) {}

    final decodedJson = json.decode(response.body);

    final user = LoginResponse.fromJson(decodedJson);

    // loginResponse = LoginResponse.fromJson(json.decode(response.body));
    print(user.status);

    return user;
  }
}
