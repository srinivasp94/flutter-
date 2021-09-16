import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/authentication/signin_widget.dart';
import 'package:flutter_demo/ui/authentication/signup_widget.dart';

class HomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(

                  text: 'Sign In',
                ),
                Tab(

                  text: 'Sign Up',
                ),

              ],
            ),
            title: const Text('NetzApp'),
          ),
          body: const TabBarView(
            children: [
              SignIn(),
              SignUp()
            ],
          ),
        ),
      ),
    );
  }
}
