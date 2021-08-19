import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_demo/ui/authentication/signin_widget.dart';
import 'package:flutter_demo/ui/authentication/signup_screen.dart';

class StackOver extends StatefulWidget {

  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]

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
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Card(
                        elevation: 2.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(children: <Widget>[
                          SizedBox(
                              height: 20.0
                          ),
                          Container(
                            height: 45,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              // give the indicator a decoration (color and border radius)
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Colors.deepPurple,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[500],
                              tabs: [
                                // first tab [you can add an icon using the icon property]
                                Tab(text: 'Sign In'),

                                // second tab [you can add an icon using the icon property]
                                Tab(
                                  text: 'Sign Up',
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // first tab bar view widget
                                  SignIn(),

                                  // second tab bar view widget
                                  SignupScreen()
                                ],
                              ),
                            ),
                          ),
                        ]
                        )
                    ),
                  ))
              // tab bar view here
            ],
          ),
        ),
      ),
    ));
  }
}
