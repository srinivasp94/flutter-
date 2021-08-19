import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/CategoryItem.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/catagory/catalogueScreen.dart';
import 'package:flutter_demo/ui/catagory/catalogue_cart_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RedemptionScreen extends StatefulWidget {
  @override
  _RedemptionScreenState createState() => _RedemptionScreenState();
}

class _RedemptionScreenState extends State<RedemptionScreen> {
  SharedPreferences _sharedPreferences;

  List<CatalogueCartItem> mRedemptionList = new List();

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreferences = sp;
    });

    getCartListData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.deepPurple[100],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${mRedemptionList.length} items in Cart",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[900]),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              processRedemption();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.deepPurple,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 5.0, 8.0, 5.0),
                                child: Text(
                                  "Proceed",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return redemptionListItem(
                        mRedemptionList.elementAt(position), position);
                  },
                  itemCount:
                      mRedemptionList != null ? mRedemptionList.length : 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getCartListData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String _cartString =
        _sharedPreferences.getString("KEY_CUSTOMER_CART_COLLECTION_LIST");
    mRedemptionList = (json.decode(_cartString) as List)
        .map((_cartString) => CatalogueCartItem.fromJson(_cartString))
        .toList();
    // mRedemptionList = json.decode(_cartString);
    print("mRedemption Type is ${mRedemptionList.runtimeType}");
    print("mRedemption list is ${mRedemptionList.length}");
  }

  Widget redemptionListItem(CatalogueCartItem item, int position) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.all(6.0),
          color: Colors.white,
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: Image.network(
                    "https://secure.inspirenetz.com/in-resources/" +
                        item.catalogueResource.catProductImagePath),
                title: Text(
                  item.catalogueResource.catCategoryName,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                ),
                subtitle: Text(
                  item.catalogueResource.catDescription,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                        item.catalogueResource.catNumPoints.toString() + "Pts",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14.0,
                            letterSpacing: 1.0),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: RawMaterialButton(
                          elevation: 2.0,
                          fillColor: Colors.white,
                          onPressed: () {
                            manupulateCartItems(item, "Reduce", position);
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.deepPurple,
                          ),
                          highlightColor: Colors.deepPurple,
                          padding: EdgeInsets.all(0.0),
                          shape: CircleBorder(),
                        )),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          item.qty.toString(),
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 14.0,
                              letterSpacing: 1.0),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: RawMaterialButton(
                          elevation: 2.0,
                          fillColor: Colors.white,
                          onPressed: () {
                            manupulateCartItems(item, "Add", position);
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.deepPurple,
                          ),
                          highlightColor: Colors.deepPurple,
                          padding: EdgeInsets.all(0.0),
                          shape: CircleBorder(),
                        )),
                    SizedBox(
                      width: 2.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: RawMaterialButton(
                        elevation: 2.0,
                        fillColor: Colors.grey[100],
                        onPressed: () {},
                        child: Icon(Icons.delete),
                        highlightColor: Colors.deepPurple,
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void processRedemption() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }));

    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/catalogueredemption');
    try {
      for (CatalogueCartItem cartItem in mRedemptionList) {
        Map<String, String> headerMap = {
          "prdcode": cartItem.catalogueResource.catProductCode,
          "quantity": cartItem.qty.toString(),
          "channel": "1",
          "destLoyaltyId": "0",
          "merchantno": cartItem.catalogueResource.catMerchantNo.toString(),
        };

        final response = await client.post(url, body: headerMap);

        print("Redemption Response is ${response.body} ");

        mRedemptionList.remove(cartItem);
        _sharedPreferences.setString(
            "KEY_CUSTOMER_CART_COLLECTION_LIST", jsonEncode(mRedemptionList));

        setState(() {
          String _cartString =
              _sharedPreferences.getString("KEY_CUSTOMER_CART_COLLECTION_LIST");
          mRedemptionList = (json.decode(_cartString) as List)
              .map((_cartString) => CatalogueCartItem.fromJson(_cartString))
              .toList();
        });
      }
    } catch (Exception) {
      //Handle exception here
    } finally {

      Navigator.pop(context);
    }
  }

  void manupulateCartItems(
      CatalogueCartItem item, String btnAction, int position) {
    CatalogueCartItem cartItem = item;
    if (btnAction == "Add") {

      cartItem.catProductNo = item.catProductnum.toString();
      cartItem.mCategoryItem = item.catalogueResource;
      cartItem.operation = "Add";
      cartItem.status = "Added";
      cartItem.qty += 1;
      mRedemptionList.removeAt(position);
      mRedemptionList.insert(position,cartItem);
    } else if (btnAction == "Reduce") {
      if (item.qty==1) {
        Fluttertoast.showToast(
            msg: "Minimum Quantity should be 1",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.grey[400],
            textColor: Colors.white,
            fontSize: 16.0);
      }else{
        cartItem.catProductNo = item.catProductnum.toString();
        cartItem.mCategoryItem = item.catalogueResource;

        cartItem.qty = (item.qty) - 1;
        cartItem.operation = "Reduce";
        cartItem.status = "Reduced";
        mRedemptionList.removeAt(position);
        mRedemptionList.insert(position,cartItem);
      }
    }
    _sharedPreferences.setString(
        "KEY_CUSTOMER_CART_COLLECTION_LIST", json.encode(mRedemptionList));

    setState(() {
      mRedemptionList = mRedemptionList;
    });
  }
}
