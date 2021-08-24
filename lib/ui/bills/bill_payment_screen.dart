import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/network/DigestAuth.dart';
import 'package:flutter_demo/ui/bills/partner.dart';
import 'package:flutter_demo/ui/bills/redemption_partners.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillPaymentScreen extends StatefulWidget {
  @override
  _BillPaymentScreenState createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {

  TextEditingController amountController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  List<Partner> partnerList = new List<Partner>();
  List<DropdownMenuItem<String>> dropDownPartnerList = new List();

  String _selectedPartner;

  @override
  void initState() {
    super.initState();
    _callApiPartnersList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/header_bg.png'),
            fit: BoxFit.cover,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Pay Bills",
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
        body: Column(
          children: [
            new DropdownButton(
                items: dropDownPartnerList,
                value: _selectedPartner,
                onChanged: changedPartnerDropDown
            ),
            SizedBox(
              height: 12,
            ),
           Expanded(
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: amountController,
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                         fillColor: Colors.white12,
                         hintText: 'Amount',
                         prefixIcon: Icon(Icons.phone_outlined),
                         hintStyle: TextStyle(color: Colors.grey[400]),
                         filled: true,
                         enabledBorder: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(24.0)),
                           borderSide:
                           BorderSide(color: Colors.grey[400], width: 1),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(24.0)),
                           borderSide: BorderSide(
                               color: Colors.deepPurple[200], width: 1),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 12,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: accountController,
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                         fillColor: Colors.white12,
                         hintText: ' Account Number',
                         prefixIcon: Icon(Icons.phone_outlined),
                         hintStyle: TextStyle(color: Colors.grey[400]),
                         filled: true,
                         enabledBorder: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(24.0)),
                           borderSide:
                           BorderSide(color: Colors.grey[400], width: 1),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(24.0)),
                           borderSide: BorderSide(
                               color: Colors.deepPurple[200], width: 1),
                         ),
                       ),
                     ),
                   ) ,
                   SizedBox(
                     height: 12,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: TextField(
                       controller: pinCodeController,
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                         fillColor: Colors.white12,
                         hintText: ' PIN Code',
                         prefixIcon: Icon(Icons.phone_outlined),
                         hintStyle: TextStyle(color: Colors.grey[400]),
                         filled: true,
                         enabledBorder: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(24.0)),
                           borderSide:
                           BorderSide(color: Colors.grey[400], width: 1),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius:
                           BorderRadius.all(Radius.circular(24.0)),
                           borderSide: BorderSide(
                               color: Colors.deepPurple[200], width: 1),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 12,
                   ),
                   ElevatedButton(

                     onPressed: (() {
                       setState(() {
                         if (amountController.text
                             .toString()
                             .isEmpty) {
                           // _showToast(context);
                           Fluttertoast.showToast(
                               msg: "Amount is Empty",
                               toastLength: Toast.LENGTH_SHORT,
                               backgroundColor: Colors.grey[400],
                               textColor: Colors.white,
                               fontSize: 16.0);
                         } else if (accountController.text
                             .toString()
                             .isEmpty) {
                           // _showToast(context);

                           Fluttertoast.showToast(
                               msg: "Account number is empty",
                               toastLength: Toast.LENGTH_SHORT,
                               backgroundColor: Colors.grey[400],
                               textColor: Colors.white,
                               fontSize: 16.0);
                         } else if (pinCodeController.text
                             .toString()
                             .isEmpty) {
                           // _showToast(context);

                           Fluttertoast.showToast(
                               msg: "PIN Code is empty",
                               toastLength: Toast.LENGTH_SHORT,
                               backgroundColor: Colors.grey[400],
                               textColor: Colors.white,
                               fontSize: 16.0);
                         } else {
                           callPayBillApi();
                         }
                       });
                     }),
                     child: Text(
                       "Proceed",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 18.0,
                       ),
                     ),
                   )
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }

  void changedPartnerDropDown(String selectedItem) {
    setState(() {
      _selectedPartner = selectedItem;
    });
  }

  void _callApiPartnersList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/redemptionmerchants/40');

    final response = await client.get(url);

    RedemptionPartnersResponse partnersResponse =
    new RedemptionPartnersResponse();

    print(response.body);
    if (response.statusCode == 200) {
      partnersResponse =
          RedemptionPartnersResponse.fromJson(json.decode(response.body));

      if (partnersResponse.data != null && partnersResponse.data.length > 0) {
        partnerList = partnersResponse.getPartnerByType();
        getDropDownItems();
      }
    }
  }

  void getDropDownItems() {
    if (partnerList != null) {
      print(partnerList);
      partnerList.forEach((element) {
        dropDownPartnerList.add(new DropdownMenuItem(
          child: new Text(element.remName),
          value: element.remName,

        ));
      });
    }
  }

  void callPayBillApi() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var client = DigestAuthClient(preferences.getString("Key_UserName"),
        preferences.getString("Key_Password"));

    final url = Uri.parse(
        'https://secure.inspirenetz.com/inspirenetz-api/api/0.9/json/customer/cashback');

    Map<String,String> headersMap = {
      "merchantNo": "40",
      "merchantIdentifier":"",
      "amount":amountController.text.toString(),
      "pin":pinCodeController.text.toString(),
      "channel":"3",
      "otpCode":"",
      "ref":accountController.text.toString(),
    };

    final response = await client.post(url,body: headersMap);

    if (response.statusCode==200) {
      Fluttertoast.showToast(msg: "Payments Success",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      Fluttertoast.showToast(msg: "Payments Operation Failed",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }
}
