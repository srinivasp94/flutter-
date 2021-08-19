import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/balance_cards.dart';
import 'package:flutter_demo/model/reward_balance.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DummySwipe extends StatefulWidget {
  @override
  _DummySwipeState createState() => _DummySwipeState();
}

class _DummySwipeState extends State<DummySwipe> {

  List<CardBalance> mCardsList = new List<CardBalance>();

  @override
  void initState() {
    super.initState();
    _callCardsApi();
  }

  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      items: mCardsList.map((model){
        return  Card  (
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          color: Colors.deepPurple,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.card_giftcard,
                  color: Colors.white,),
                title: Text(
                  model.rwdName,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(height: 1.0,color: Colors.grey[400],),
              SizedBox(height: 18.0,),
              Expanded(child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:                  MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Balance",

                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            model.rwdBalance.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Cash Back",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            model.cashbackValue.toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[300],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ))
            ],
          ),
        );
      }).toList(),
        onPageChanged: (index) {
          setState(() {
            index;
          });
        }

    );
  }

  Future<List<CardBalance>> _callCardsApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/compatible/rewardbalance?merchant_no=40');

    Map<String, String> headerMap = {"merchant_no": "40"};

    // final response = await client.get(url, headers: headerMap);
    final response = await client.get(url);

    final decodedJson = json.decode(response.body);

    print("Cards swipe:- " + response.body);

    RewardBalance rewardBalance = new RewardBalance();
    print("res Codes:- " + response.statusCode.toString());
    if (response.statusCode == 200) {
      rewardBalance = RewardBalance.fromJson(decodedJson);

      print("balance status :- " + rewardBalance.status.toString());
      print("balance list :- " + rewardBalance.data.toString());

      if (rewardBalance.data.length > 0) {
        setState(() {
          mCardsList = rewardBalance.data;
        });
      } else {
        Text("No activities available");
      }
    }
  }

}

