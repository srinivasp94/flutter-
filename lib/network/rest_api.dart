import 'dart:convert';

import 'package:flutter_demo/model/reward_balance.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://secure.inspirenetz.com/inspirenetz-api/api/0.9';
  static const String Cards_URL = '/json/merchant/storedvaluecard/cardmasters/loyaltyid/9600626406';

}
class ApiService{
  static Future<RewardBalance> getCards() async{
    final response = await http.get('${URLS.BASE_URL}+${URLS.Cards_URL}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      return null;
    }
  }
}