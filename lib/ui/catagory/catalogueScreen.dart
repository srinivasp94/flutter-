import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/ui/cart/redemption_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_demo/model/CategoryItem.dart';
import 'package:flutter_demo/model/CategoryResponse.dart';
import 'package:flutter_demo/ui/catagory/catalogue_cart_item.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatagoryList extends StatefulWidget {
  @override
  _CatagoryListState createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {

  SharedPreferences _sharedPreferences;

  List<CategoryItem> _mCatalogueList = new List<CategoryItem>();

  bool isBottomSheetOpen = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      _sharedPreferences = sp;
    });

    getCatagories();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title:
          Align(alignment: Alignment.centerLeft, child: Text("Catalogue")),
          centerTitle: true,
          /*leading: Icon(Icons.arrow_back,
          color: Colors.white,),
          title: Container(
              height: 80.0,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Catalogue"))),
          backgroundColor: Colors.deepPurple,*/
        ),
        body:!isLoading? Center(child: CircularProgressIndicator(),):
        ListView.builder(
          itemBuilder: (context, position) {
            return categoryItemCard(_mCatalogueList[position]);
          },
          itemCount: _mCatalogueList != null ? _mCatalogueList.length : 0,
        ),
      ),
    );
  }

  Widget categoryItemCard(CategoryItem item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(6.0),
        color: Colors.white,
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RedemptionScreen()));
                },
                leading: Image.network(
                    "https://secure.inspirenetz.com/in-resources/" +
                        item.catProductImagePath),
                title: Text(
                  item.catCategoryName,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                ),
                subtitle: Text(
                  item.catDescription,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 3.0, 8.0, 3.0),
                      child: InkWell(
                        onTap: () {

                          _modalBottomSheetMenu(item);
                        },
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.deepPurple,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 3.0, 8.0, 3.0),
                    child: Text(
                      item.catNumPoints.toString() + " pts",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<CategoryItem>> getCatagories() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    print(preferences.getString("Key_UserName") +
        " - " +
        preferences.getString("Key_Password"));

    Map<String, String> headers = {
      "filter": "name",
      "query": '',
      "catMerchantNo": "40",
      "catCategory": "0",
      "sortOption": "1",
      "channel": "2",
    };

    String queryString = Uri(queryParameters: headers).query;

    String endpointUrl =
        "https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/user/catalogues/search?filter=name&query&catMerchantNo=40&catCategory=0&sortOption=1&channel=2";

    var requestUrl = endpointUrl + '?' + queryString; // result

    // final response = await client.get(endpointUrl, headers: headers);
    final response = await client.get(endpointUrl);

    CategoryResponse categoryResponse = new CategoryResponse();

    if (response.statusCode == 200) {
      categoryResponse = CategoryResponse.fromJson(json.decode(response.body));

      setState(() {
        isLoading = true;
        _mCatalogueList = categoryResponse.data;
      });
    }
  }

  void _modalBottomSheetMenu(CategoryItem categoryItem) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        context: context,
        builder: (builder) {
          return new Container(
              color: Colors.transparent,
              //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Expanded(
                            child: Image.network(
                                "https://secure.inspirenetz.com/in-resources/" +
                                    categoryItem.catProductImagePath,
                                // width: 300,
                                height: 120,
                                fit: BoxFit.scaleDown),
                          ),
                          /* Image(image: NetworkImage("https://secure.inspirenetz.com/in-resources/"+categoryItem.catProductImagePath,)
                           ),*/
                        ),
                        ListTile(
                          leading: Image.network(
                              "https://secure.inspirenetz.com/in-resources/" +
                                  categoryItem.catProductImagePath),
                          title: Text(categoryItem.catCategoryName),
                          subtitle: Text(categoryItem.catDescription.isNotEmpty
                              ? categoryItem.catDescription
                              : "Description"),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Details",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(categoryItem.catLongDescription.toString() == null
                            ? categoryItem.catLongDescription
                            : "Description"),
                        SizedBox(
                          height: 8.0,
                        ),
                        Divider(
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                "Category",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                categoryItem.catCategoryName,
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                "Merchant",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                categoryItem.merMerchantName,
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                "Reward Currency",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                categoryItem.rwdCurrencyName,
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                "Points Required",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                categoryItem.catNumPoints.toString(),
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              style: flatButtonStyle,
                              onPressed: () {
                                createAddToCart(categoryItem, "Add");
                              },
                              child: Text(

                                "Add to Cart",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                backgroundColor: Colors.blue,
                                color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Colors.blue,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  Map<String, CatalogueCartItem> getCustomerCartCollection() {
    print("get catagories cart collection");

    String strCatalogueList =
    _sharedPreferences.get("KEY_CUSTOMER_CART_COLLECTION");

    if (strCatalogueList == null) {

      return null;

    } else {

      var tempMap = jsonDecode(strCatalogueList);
      // print("tempMap :- " + tempMap.toString());

      Map<String, CatalogueCartItem> sharedMap = Map();

      tempMap.forEach((key, value) {

        sharedMap[key] = value as CatalogueCartItem;

      });

      return sharedMap;
    }
  }

  void addToCartPage(CategoryItem categoryItem, String buttonAction) {
    Map<String, CatalogueCartItem> mCartItem = getCustomerCartCollection();

    if (mCartItem == null) {
      mCartItem = Map();
      mCartItem[categoryItem.catProductNo.toString()] =
          createCartItem(categoryItem);
    } else {
      if (mCartItem.containsKey(categoryItem.catProductNo.toString())) {
        mCartItem.update(
            categoryItem.catProductNo.toString(),
                (value) =>
                manipulateItem(categoryItem.catProductNo.toString(),
                    mCartItem[categoryItem.catProductNo.toString()],
                    buttonAction));
      } else {
        mCartItem[categoryItem.catProductNo.toString()] =
            createCartItem(categoryItem);
      }
    }
    var mapStr = json.encode(mCartItem);

    _sharedPreferences.setString("KEY_CUSTOMER_CART_COLLECTION", mapStr);
  }

  CatalogueCartItem createCartItem(CategoryItem categoryItem) {
    CatalogueCartItem catalogueCartItem = CatalogueCartItem();

    catalogueCartItem.catProductNo = categoryItem.catProductNo.toString();
    catalogueCartItem.mCategoryItem = categoryItem;
    catalogueCartItem.qty = 1;
    catalogueCartItem.operation = "Add";
    catalogueCartItem.status = "Added";

    return catalogueCartItem;
  }

  CatalogueCartItem manipulateItem(String mapKey, CatalogueCartItem cartItem,
      String buttonAction) {
    CatalogueCartItem catalogueCartItem = CatalogueCartItem();
    catalogueCartItem.catProductNo = mapKey;
    catalogueCartItem.mCategoryItem = cartItem.catalogueResource;

    if (buttonAction == "Add") {
      cartItem.qty += 1;
      catalogueCartItem.operation = "Add";
      catalogueCartItem.status = "Added";
    } else if (buttonAction == "Reduce") {
      cartItem.qty -= 1;
      catalogueCartItem.operation = "Reduce";
      catalogueCartItem.status = "Reduceed";
    } else {
      catalogueCartItem.operation = "Redeem";
      catalogueCartItem.status = "Redeemed";
    }
    return catalogueCartItem;
  }

  List<CatalogueCartItem> getLocalcartList() {
    String strCatalogueList =
    _sharedPreferences.getString("KEY_CUSTOMER_CART_COLLECTION_LIST");

    if (strCatalogueList == null) {
      print("strCatalogueList is null");

      return null;
    } else {
      print("strCatalogueList not null");

      List<CatalogueCartItem> catagory_mList =
      (json.decode(strCatalogueList) as List)
          .map((strCatalogueList) =>
          CatalogueCartItem.fromJson(strCatalogueList))
          .toList();

      return catagory_mList;
    }
  }

  void createAddToCart(CategoryItem categoryItem, String buttonAction) {
    List<CatalogueCartItem> mCartLocalList = getLocalcartList();

    HashMap<String, CatalogueCartItem> _mCartMap =
    generateCartmap(mCartLocalList);

    if (_mCartMap == null) {
      _mCartMap  = new HashMap();
      _mCartMap.putIfAbsent(categoryItem.catProductNo.toString(), () => createCartItem(categoryItem));
    } else {
      if (_mCartMap.containsKey(categoryItem.catProductNo.toString())) {
        if (buttonAction == "Add") {
          CatalogueCartItem catalogueCartItem = _mCartMap[categoryItem
              .catProductNo.toString()];
          catalogueCartItem.catProductNo =
              categoryItem.catProductNo.toString();
          catalogueCartItem.mCategoryItem = categoryItem;
          catalogueCartItem.qty += 1;
          catalogueCartItem.operation = "Add";
          catalogueCartItem.status = "Added";

          _mCartMap.update(categoryItem.catProductNo.toString(), (
              value) => catalogueCartItem);
        } else if (buttonAction == "Reduce") {
          CatalogueCartItem catalogueCartItem = _mCartMap[categoryItem
              .catProductNo.toString()];
          catalogueCartItem.catProductNo =
              categoryItem.catProductNo.toString();
          catalogueCartItem.mCategoryItem = categoryItem;
          if (catalogueCartItem.qty == 1) {
            _mCartMap.remove(categoryItem.catProductNo.toString());
          } else {
            catalogueCartItem.qty = (catalogueCartItem.qty) - 1;
            catalogueCartItem.operation = "Reduce";
            catalogueCartItem.status = "Reduced";
            _mCartMap.update(categoryItem.catProductNo.toString(), (
                value) => catalogueCartItem);
          }
        }
      } else {
        _mCartMap[categoryItem.catProductNo.toString()] =
            createCartItem(categoryItem);
      }
    }

    List<CatalogueCartItem> sharedCartList = List();

    _mCartMap.forEach((k, v) => sharedCartList.add(v));

    var mDecodeCart = jsonEncode(sharedCartList);
    _sharedPreferences.setString(
        "KEY_CUSTOMER_CART_COLLECTION_LIST", mDecodeCart);

    Fluttertoast.showToast(
        msg: "Item Added to Cart",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey[400],
        textColor: Colors.white,
        fontSize: 16.0);

    Navigator.pop(context);

  }
}

HashMap<String, CatalogueCartItem> generateCartmap(
    List<CatalogueCartItem> mItemsList) {
  HashMap<String, CatalogueCartItem> map = new HashMap();
  if (mItemsList == null) {
    return null;
  } else {
    for (CatalogueCartItem item in mItemsList) {
      map[item.catProductnum] = item;
    }
    return map;
  }
}