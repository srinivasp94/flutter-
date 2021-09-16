import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/model/balance_cards.dart';
import 'package:flutter_demo/model/reward_balance.dart';
import 'dart:convert';

import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/bottompages/rewards_bloc/rewards_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewardCards extends StatefulWidget {
  @override
  _RewardCardsState createState() => _RewardCardsState();
}

class _RewardCardsState extends State<RewardCards> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RewardsBloc()..add(FetchRewardsEvent()),
      child: BlocBuilder<RewardsBloc, RewardsState>(
        builder: (context, state) {
          if(state is RewardsLoadedState) {
            print('Rewards Data: ${state.cardBalanceList?.length ?? 0}');
            return Container(
              height: 150.0,
              width: double.infinity,
              child: Swiper(
                containerHeight: 150.0,
                containerWidth: double.infinity,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  CardBalance reward = state.cardBalanceList.elementAt(index);
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    color: Colors.deepPurple[700],
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.card_giftcard,
                            color: Colors.white,
                          ),
                          title: Text(
                            reward.rwdName,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          reward.rwdBalance.toString(),
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
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
                                          reward.cashbackValue.toString(),
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
                },
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: state.cardBalanceList != null ? state.cardBalanceList.length : 0,
              ),
            );
          } else if(state is RewardsEmptyState) {
            return Container(height: 150, width: double.infinity, child: Center(child: Text('No Rewards Available'),));
          } else if(state is RewardsErrorState) {
            return Container(height: 150, width: double.infinity, child: Center(child: Text('No Rewards Available'),));
          } else {
            return Container(height: 150, width: double.infinity, child: Center(child: CircularProgressIndicator(),));
          }
        },
      ),
    );
  }
}
