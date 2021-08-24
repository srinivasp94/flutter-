
import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/authentication/stackover.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      // TODO: check for already logged in or not
       Navigator.of(context).push(MaterialPageRoute(builder: (_) => StackOver()));
       Navigator.of(context).pushNamed('/');

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashState(),
        '/loginpage': (context) => StackOver()
      },
    );
  }
}

class SplashState extends StatefulWidget {
  @override
  _SplashStateState createState() => _SplashStateState();
}

class _SplashStateState extends State<SplashState> {
  @override
  Widget build(BuildContext context) {
    /*Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreenApp())));*/

    return Container(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/splash_image.png'),
          fit: BoxFit.cover,
        )
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StackOver()));
          },
          child: Text(
            "Login Screen",
            style: TextStyle(fontFamily: 'Quicksand'),
          ),
        ),
      ),
    );
  }
}
