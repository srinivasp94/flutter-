import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  bool _value = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Edit Profile'),
        ),
        body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,8.0,12.0,8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // controller: loginEmailController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          fillColor: Colors.white12,
                          hintText: ' First Name',
                          labelText: ' First Name',

                          hintStyle: TextStyle(color: Colors.grey[400]),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                            BorderSide(color: Colors.grey[400], width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Colors.deepPurple[200], width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // controller: loginPasswordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.white12,
                          hintText: 'Last Name ',
                          labelText: 'Last Name ',

                          hintStyle: TextStyle(color: Colors.grey[400]),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                            BorderSide(color: Colors.grey[400], width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Colors.deepPurple[200], width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // controller: loginEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.white12,
                          hintText: ' Email',
                          labelText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                            BorderSide(color: Colors.grey[400], width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Colors.deepPurple[200], width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // controller: loginPasswordController,
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white12,
                          hintText: 'Mobile  ',
                          labelText: 'Mobile  ',

                          hintStyle: TextStyle(color: Colors.grey[400]),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide:
                            BorderSide(color: Colors.grey[400], width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Colors.deepPurple[200], width: 1),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Gender",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 15.0
                      ),
                      ),
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                           Radio(
                            value: 1,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                            activeColor: Colors.green,

                        ),
                        Text("Male",
                          style: new TextStyle(fontSize: 16.0),),
                         Radio(
                            value: 2,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value;
                              });
                            },
                            activeColor: Colors.green,

                        ),
                        Text("Female",
                          style: new TextStyle(fontSize: 16.0),),

                      Radio(
                          value: 3,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = value;
                            });
                          },
                          activeColor: Colors.green,

                        ),
                        Text("Other",
                          style: new TextStyle(fontSize: 16.0),),

                      ],
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Marital Status",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15.0
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: val,
                          // onChanged: val,
                        ),
                        new Text(
                          'Single',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: 1,
                          groupValue: val,
                          // onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          'Married',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              _updateProfile();
            }, child: Text('Update Profile',
              style: TextStyle(
            fontSize: 14.0,
            color: Colors.white
              ),
            ),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.deepPurple,
                onSurface: Colors.grey,
              ),
            )
          ],
        ) ,
      ),
    );
  }

  void _updateProfile() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("Credentials: - " +
        preferences.getString("Key_UserName") +
        "  -  " +
        preferences.getString("Key_Password"));
    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/info/update');

    Map<String, String> headerMap = {"cusMerchantNo": "40",
      "cusFName" : "",
      "cusLName" : "",
      "cusEmail" : "",
      "cspGender" : "",
      "cspFamilyStatus" : "",
      "cspCustomerAnniversary" : "",
      "cusMobile" : "",
      "cspCustomerBirthday" : "",
    };

    final response = await client.post(url,body: headerMap);

    final decodeJson  = json.decode(response.body);

    if (response.statusCode ==200) {

    }else{

    }
  }
}
