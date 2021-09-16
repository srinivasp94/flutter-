import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/home/activity_type.dart';
import 'package:flutter_demo/model/activity_item.dart';
import 'package:flutter_demo/model/recent_activity.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/bottompages/cards_bloc/cards_bloc.dart';
import 'package:flutter_demo/ui/bottompages/swipe_reward_cards.dart';
import 'package:flutter_demo/ui/promotions/promotion_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class CardsScreen extends StatefulWidget {
  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CardsBloc>(
        create: (_) => CardsBloc()..add(FetchCardsAndActivitiesEvent()),
        child: BlocBuilder<CardsBloc, CardsState>(
          builder: (context, state) {
            if(state is CardsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if(state is CardsLoadedState) {
              return _getLoadedStateWidget(state);
            } else if(state is CardsEmptyState) {
              return Center(child: Text('Cards data not found'));
            } else if(state is CardsErrorState) {
              return Center(child: Text('Oops! Something went wrong please try again later'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }


  Widget _getLoadedStateWidget(CardsLoadedState state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 300.0,
            child: Stack(
              fit:StackFit.expand ,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/header_bg.png',
                      fit: BoxFit
                          .cover,),

                  ),

                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 280,
                    color: Colors.white12,
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 10,
                  left: 10,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        6.0, 40.0, 6.0, 0.0),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(10.0))),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0)),
                        elevation: 10.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text('Sandeep Menon',

                                  style:
                                  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                    letterSpacing: 1.0,
                                    fontSize: 18.0,
                                  )
                              ),
                              subtitle: Text(
                                  'Sandeepmenon@gmail.com'),
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.blue[500],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 0, 12.0, 0),
                              child: Divider(
                                height: 1.0,
                                color: Colors.grey[300],
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text('Balance',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0)),
                                subtitle: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .start,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      '14000',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold,
                                          color: Colors
                                              .deepPurple,
                                          fontSize: 18.0),
                                    ), Text(
                                      'Pts ',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .normal,
                                          color: Colors
                                              .deepPurple,
                                          fontSize: 12.0),
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.deepPurple,
                                        Colors.purple,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: new BorderRadius
                                        .all(
                                        const Radius.circular(
                                            10.0)),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets
                                        .fromLTRB(
                                        14.0, 1.0, 14.0, 1.0),
                                    child: Text("GOLD",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: LinearPercentIndicator(
                                lineHeight: 10.0,
                                percent: 0.5,
                                backgroundColor: Colors.grey[200],
                                progressColor: Colors.deepPurple,
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  18.0, 0, 0, 8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Get more 400 points to unlock Platinum Tier",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[400]
                                  ),),
                              ),
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
          SizedBox(height: 10.0,),

          RewardCards(),
          // DummySwipe(),
          SizedBox(height: 10.0,),

          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Activity",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          SizedBox(height: 10.0,),

          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 15.0,
              child: Container(
                child: ListView.builder(
                  itemCount: state.activities != null && state.activities.length >= 3 ? /*mList.length*/3 : 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    ActivityItem activity = state.activities.elementAt(index);
                    return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    activity.cuaRemarks.toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors
                                          .deepPurple,
                                    ),
                                  ),
                                ),
                                Text(
                                  getActivityType(activity.cuaActivityType),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[300],
                                  ),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment
                                  .start,
                              children: <Widget>[
                                Text(
                                  activity.cuaDate.toString(),
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
                                  activity.cuaTime.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[300],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              height: 1.0,
                              color: Colors.grey[300],
                            )
                          ],
                        )
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: 10.0,),

          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Offers & Promos",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          PromotionsScreen(),
        ],
      ),
    );
  }

  String getActivityType(int activityType) {
    var activityTypeInText = "";
    if (activityType == ActivityType.REGISTER) {
      activityTypeInText = "Register";
    } else if (activityType == ActivityType.EARNING) {
      activityTypeInText = "Earning";
    } else if (activityType == ActivityType.REDEMPTION) {
      activityTypeInText = "Redemption";
    } else if (activityType == ActivityType.TRANSFER_POINT) {
      activityTypeInText = "Transfer Point";
    } else if (activityType == ActivityType.BUY_POINT) {
      activityTypeInText = "Buy Point";
    } else if (activityType == ActivityType.POINT_ENQUIRY) {
      activityTypeInText = "Points Enquiry";
    } else if (activityType == ActivityType.REDEMPTION_ENQUIRY) {
      activityTypeInText = "Redemption Enquiry";
    } else if (activityType == ActivityType.EVENT_REGISTER) {
      activityTypeInText = "Event Register";
    } else if (activityType == ActivityType.UNREGISTER) {
      activityTypeInText = "Unregister";
    } else if (activityType == ActivityType.ACCOUNT_LINKING) {
      activityTypeInText = "Account Linking";
    } else if (activityType == ActivityType.POINT_DEDUCTION) {
      activityTypeInText = "Point Deduction";
    } else if (activityType == ActivityType.TRANSFER_ACCOUNT) {
      activityTypeInText = "Transfer Account";
    } else if (activityType == ActivityType.REWARD_EXPIRY) {
      activityTypeInText = "Reward Expiry";
    } else if (activityType == ActivityType.TIER_UPGRADE) {
      activityTypeInText = "Tier Upgrade";
    } else if (activityType == ActivityType.TIER_DOWNGRADE) {
      activityTypeInText = "Tier Downgrade";
    } else if (activityType == ActivityType.CASH_BACK_REDEMPTION) {
      activityTypeInText = "Cash back Redemption";
    } else if (activityType == ActivityType.CASHBACK) {
      activityTypeInText = "Cash back";
    }
    return activityTypeInText;
  }

}


/*
Widget build(BuildContext context) {
  return FutureBuilder<List<ActivityItem>>(
    future: _activitiesApiCall(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<ActivityItem> data = snapshot.data;
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Text(data[index].cuaParams);
            });;
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}
*/

Future<Widget> _activitylistTile(List<ActivityItem> mListActivity) {
  Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 200.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mListActivity.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(mListActivity[index].cuaActivityType.toString());
      },
    ),
  );
}
