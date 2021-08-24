import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/authentication/tab_pages.dart';
import 'package:flutter_demo/ui/bills/bill_payment_screen.dart';
import 'package:flutter_demo/ui/bottompages/cards_screen.dart';
import 'package:flutter_demo/ui/bottompages/swipe_reward_cards.dart';
import 'package:flutter_demo/ui/cart/redemption_page.dart';
import 'package:flutter_demo/ui/catagory/catalogueScreen.dart';
import 'package:flutter_demo/ui/profile/profile_view_screen.dart';
import 'package:flutter_demo/ui/promotions/promotion_screen.dart';
import 'package:flutter_demo/ui/referral/referral_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int pageIndex = 0;

  PageController _homePageController = PageController(initialPage: 0);


  final CardsScreen _cardsScreen = CardsScreen();
  final  CatagoryList  _cartScreen=  CatagoryList();
  final HomeTabPage _homeTabPage = HomeTabPage();

  Widget pageChooser() {
    switch (this.pageIndex) {
      case 0:
        return _cardsScreen;
        break;

      case 1:
        return _homeTabPage;
        break;

      case 2:
        return _cardsScreen;
        break;

      default:
        return new Container(
          child: new Center(
              child: new Text('No page found by page chooser.',
                  style: new TextStyle(fontSize: 30.0))),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body:  PageView(
            controller: _homePageController,
            onPageChanged: (int){

            },
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              _cardsScreen,
              _cartScreen,
              new RedemptionScreen(),
             // new ProfileView(),
             // new ReferralScreen()
              new BillPaymentScreen()

            ],
          )
          /*CatagoryList()*//*TabBarView(

            children: [
              Home(),
              CardsScreen(),
              Home(),
              CardsScreen(),
            ],
          )*/,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                     _homePageController.jumpToPage(0);
                    });
                  },
                ),
                SizedBox(width: 30.0),
                IconButton(
                  icon: Icon(
                    Icons.web,
                  ),
                  onPressed: () {
                   setState(() {
                     _homePageController.jumpToPage(1);
                   });
                  },
                ),
                SizedBox(width: 30.0),
                IconButton(
                  icon: Icon(
                    Icons.account_balance_wallet_outlined,
                  ),
                  onPressed: () {
                  setState(() {
                    _homePageController.jumpToPage(2);
                  });
                  },
                ),
                SizedBox(width: 30.0),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  onPressed: () {
                   setState(() {
                     _homePageController.jumpToPage(3);
                   });
                  },
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            child: Container(
                height: 15.0,

                child: Image(
                  image: AssetImage('assets/images/coupon.png'),
                  fit: BoxFit.cover,
                )),
            onPressed: () {},
          ),
        ));
  }
}

