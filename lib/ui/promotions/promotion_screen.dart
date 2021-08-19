import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/promotions/Promos.dart';
import 'package:flutter_demo/ui/promotions/PromotionModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PromotionsScreen extends StatefulWidget {
  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {

  List<Promos> _mPromosList = new List<Promos>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getPromotionsAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _mPromosList!=null ?  _mPromosList.length : 0,

          itemBuilder: (context, index) {
            return Container(
              width: 280,
              height: 200,
              child:
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.network(
                  "https://secure.inspirenetz.com/in-resources/"+ _mPromosList[index].prmImagePath,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              )

              /*Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            "https://secure.inspirenetz.com/in-resources/"+ _mPromosList[index].prmImagePath,
                        fit: BoxFit.cover,),
                      ),
                    ),
                  )*/,
            );

          }),
    );
  }

  void _getPromotionsAPI() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    String endpointUrl =
        "https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/promotions";

    final response = await client.get(endpointUrl);

    Promotions promotions = new Promotions();

    if (response.statusCode == 200) {
      promotions = Promotions.fromJson(json.decode(response.body));
      setState(() {
        print(promotions.status);
        _mPromosList = promotions.promos;
        isLoading = true;
      });
    }
  }
}
