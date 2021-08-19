import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/profile/activity_data.dart';
import 'package:flutter_demo/ui/profile/my_activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/ui/bottompages/cards_screen.dart';

class MyActivities extends StatefulWidget {
  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  bool isLoading = false;

  List<Activity> _activityData = new List<Activity>();

 final CardsScreen _cardsScreen= new CardsScreen();

  @override
  void initState() {
    super.initState();

    callApigetActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: !isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                'My Activity'
              ),),
              body: ListView.builder(
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Retail Store',
                                style: TextStyle(fontSize: 16.0, color: Colors.deepPurple),
                              ),
                              subtitle: Text(
                                _activityData[position].cuaRemarks,
                                style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                   _activityData[position].cuaDate.toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  VerticalDivider(
                                    thickness: 2.0,
                                    color: Colors.black,
                                  ),
                                  Text(
                                        _activityData[position].cuaTime.toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  Text(
                                    // _cardsScreen.getActivityType(_activityData[position].cuaActivityType) ,
                                   'Points',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[300],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8.0,)

                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _activityData != null ? _activityData.length : 0,
                ),
            ),
          ),
    );
  }

  void callApigetActivities() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/user/activities');

    Map<String, String> headerMap = {"merchant_no": "40"};

    final response = await client.get(url, headers: headerMap);

    final decodedJson = json.decode(response.body);

    print("Activity:- " + response.body);
    MyActivity myActivity = new MyActivity();

    if (response.statusCode == 200) {
      myActivity = MyActivity.fromJson(decodedJson);
      setState(() {
        _activityData = myActivity.data;
        isLoading = true;
      });
    }
  }
}
