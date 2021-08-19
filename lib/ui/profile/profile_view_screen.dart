import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/profile/edit_profile_screen.dart';
import 'package:flutter_demo/ui/profile/my_activities_screen.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header_bg.png'),
                      fit: BoxFit.fill
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                           'assets/images/app_logo.png',
                            height: 100.0,
                            width: 120.0,
                          ),
                        ),
                        Text('James Calyton',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        ),
                        SizedBox(height: 8.0,),
                        Text('Karthick101@gmail.com',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 8.0,),
                        Text('9600626406',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
                    },
                    child: Container(
                      color: Colors.white,
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.deepPurple[600],
                              textColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 18,
                              ),
                              shape: CircleBorder(),
                            ),
                            Text('Edit Profile',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward_ios)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyActivities()));
                    },
                    child: Container(
                      color: Colors.white,
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.deepPurple[600],
                              textColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                                size: 18,
                              ),
                              shape: CircleBorder(),
                            ),
                            Text('My Activities',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_forward_ios)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
