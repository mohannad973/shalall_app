import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:food_app/screens/my_offers/body.dart';


class MyOffers extends StatefulWidget {
  @override
  _MyOffersState createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppBar(titleText: 'My Offers' , showAction: false ,buildContext: context),
      bottomNavigationBar: BottomNavBar(),
      body: MyOffersBody(),
    );
  }
}
