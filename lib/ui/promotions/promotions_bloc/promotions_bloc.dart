import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/promotions/Promos.dart';
import 'package:flutter_demo/ui/promotions/PromotionModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'promotions_event.dart';
part 'promotions_state.dart';

class PromotionsBloc extends Bloc<PromotionsEvent, PromotionsState> {
  PromotionsBloc() : super(PromotionsInitial());

  @override
  Stream<PromotionsState> mapEventToState(PromotionsEvent event) async* {
    if(event is FetchPromotionsEvent) {
      try {
        List<Promos> promotions = await getPromotionsAPI();
        if(promotions != null && promotions.isNotEmpty) {
          yield PromotionsLoadedState(promotions: promotions);
        } else {
          yield PromotionsEmptyState();
        }
      }catch(e, stackTrace) {
        print('Exception: $e \n $stackTrace');
        yield PromotionsErrorState();
      }
    }
  }

  Future<List<Promos>> getPromotionsAPI() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      var client = DigestAuthClient(preferences.getString("Key_UserName"),
          preferences.getString("Key_Password"));

      String endpointUrl =
          "https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/promotions";

      final response = await client.get(endpointUrl);

      Promotions promotions = new Promotions();

      if (response.statusCode == 200) {
        promotions = Promotions.fromJson(json.decode(response.body));
        print(promotions.status);
        return promotions.promos;
      } else {
        return [];
      }
  }

}
