import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/balance_cards.dart';
import 'package:flutter_demo/model/reward_balance.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rewards_event.dart';
part 'rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  RewardsBloc() : super(RewardsInitial());

  @override
  Stream<RewardsState> mapEventToState(RewardsEvent event) async* {
    if(event is FetchRewardsEvent) {
      List<CardBalance> cardsBalanceList = await callCardsApi();
      if(cardsBalanceList != null && cardsBalanceList.isNotEmpty) {
        yield RewardsLoadedState(cardBalanceList: cardsBalanceList);
      } else {
        yield RewardsErrorState();
      }
    }
  }

  Future<List<CardBalance>> callCardsApi() async {
    try {
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
          return rewardBalance.data;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch(e, stackTrace) {
      print('Exception: $e \n $stackTrace');
      return [];
    }
  }

}
