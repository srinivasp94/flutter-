import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/activity_item.dart';
import 'package:flutter_demo/model/recent_activity.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc() : super(CardsInitial());

  @override
  Stream<CardsState> mapEventToState(CardsEvent event) async* {
    if(event is FetchCardsAndActivitiesEvent) {
      yield* _mapFetchCardsAndActivitiesEventToState(event);
    }
  }

  Stream<CardsState> _mapFetchCardsAndActivitiesEventToState(FetchCardsAndActivitiesEvent event) async* {
    try {
      await fetchCardsData(); //TODO: parse the response and pass to UI
      List<ActivityItem> activitiesData = await fetchActivitiesData();
      if(activitiesData != null && activitiesData.isNotEmpty) {
        yield CardsLoadedState(activities: activitiesData);
      } else {
        yield CardsEmptyState();
      }
    } catch(e, stackTrace) {
      print('Exception: $e \n $stackTrace');
      yield CardsErrorState();
    }
  }

  Future<void> fetchCardsData() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      var client = DigestAuthClient(preferences.getString("Key_UserName"),
          preferences.getString("Key_Password"));

      final url = Uri.parse(
          'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/compatible/rewardbalance');

      Map<String, String> headerMap = {"merchant_no": "9600626406"};

      final response = await client.get(url, headers: headerMap);

      print("Cards Response:-" + response.body);
    } catch(e, stackTrace) {
      print('Exception: $e \n $stackTrace');
    }
  }

  Future<List<ActivityItem>> fetchActivitiesData() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      print("Credentials: - " +
          preferences.getString("Key_UserName") +
          "  -  " +
          preferences.getString("Key_Password"));
      var client = DigestAuthClient(preferences.getString("Key_UserName"),
          preferences.getString("Key_Password"));

      final url = Uri.parse(
          'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/user/activities');

      Map<String, String> headerMap = {"merchant_no": "9600626406"};

      final response = await client.get(url, headers: headerMap);

      print("activities Response:-" + response.body);

      RecentActivity recentActivity = new RecentActivity();

      final decodedJson = json.decode(response.body);

      print("Response code : - " + response.statusCode.toString());

      if (response.statusCode == 200) {
        recentActivity = RecentActivity.fromJson(decodedJson);

        if (recentActivity.data.length > 0) {
          return recentActivity.data;
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
