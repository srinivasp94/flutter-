import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/referral/new_referrals_screen.dart';
import 'package:flutter_demo/ui/referral/referral_item.dart';
import 'package:flutter_demo/ui/referral/referral_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferralScreen extends StatefulWidget {
  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  List<ReferralItem> referralsList = new List<ReferralItem>();

  @override
  void initState() {
    super.initState();
    _callReferralsListApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/header_bg.png'),
            fit: BoxFit.cover,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Pay Bills",
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: referralsList != null ? referralsList.length : 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            referralsList[index].csrFName,
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 15.0),
                          ),
                          subtitle: Text(
                            referralsList[index].csrRefMobile,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                          trailing: Text(
                            "Retail Store",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ),
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.bottomCenter,
                child: Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.deepPurple,
                        minimumSize: Size(double.infinity,
                            40), // double.infinity is the width and 30 is the height
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewReferralsScreen()));
                      },
                      child: Text(' New Referrals',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0,
                              fontWeight: FontWeight.bold,letterSpacing: 1.0))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _callReferralsListApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/referral/0/0');

    final response = await client.get(url);

    ReferralResponse referrals = new ReferralResponse();

    if (response.statusCode == 200) {
      referrals = ReferralResponse.fromJson(json.decode(response.body));

      setState(() {
        referralsList = referrals.data;
      });
    }
  }
}
