import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:food_app/screens/offer/body.dart';
import 'package:food_app/screens/offer/offer_card.dart';

class OfferDetails extends StatelessWidget {
  final String title;
  final OfferCard item;
 final Offer offer;
 final Outlet outlet;

   OfferDetails({Key key, this.title, this.item,this.offer,this.outlet}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold (
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: detailsAppBar(titleText: title , buildContext: context , showAction : false),
          bottomNavigationBar: BottomNavBar(),
          body: OfferBody( item: item,outlet: outlet,offer: offer),

        ),
      ),
    );
  }
}
