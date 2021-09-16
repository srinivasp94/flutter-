import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/promotions/Promos.dart';
import 'package:flutter_demo/ui/promotions/PromotionModel.dart';
import 'package:flutter_demo/ui/promotions/promotions_bloc/promotions_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PromotionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromotionsBloc>(create: (_) => PromotionsBloc()..add(FetchPromotionsEvent()), child: BlocBuilder<PromotionsBloc, PromotionsState>(builder: (context, state) {
      if(state is PromotionsLoadedState) {
        return Container(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.promotions !=null ?  state.promotions.length : 0,
              itemBuilder: (context, index) {
                Promos promotion = state.promotions.elementAt(index);
                return Container(
                  width: 280,
                  height: 200,
                  child:
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      "https://secure.inspirenetz.com/in-resources/"+ promotion.prmImagePath,
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
                            "https://secure.inspirenetz.com/in-resources/"+ promotion.prmImagePath,
                        fit: BoxFit.cover,),
                      ),
                    ),
                  )*/,
                );

              }),
        );
      } else if(state is PromotionsLoadingState){
        return Container(height: 180, width: double.infinity, child: Center(child: CircularProgressIndicator(),),);
      } else {
        return Container(height: 180, child: Center(child: Text('There were no promotions available'),),);
      }

    },),);
  }

}
