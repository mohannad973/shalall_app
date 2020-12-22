import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/providers/cards_provider.dart';
import 'package:food_app/screens/buy_card/body.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:provider/provider.dart';


class BuyCard extends StatefulWidget {
  @override
  _BuyCardState createState() => _BuyCardState();
}

class _BuyCardState extends State<BuyCard> {
  String title = 'Buy Cards';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold (
          backgroundColor: Colors.white,
          appBar: detailsAppBar(titleText: title , buildContext: context , showAction: false),
          bottomNavigationBar: BottomNavBar(),
          body: Provider.of<CardsProvider>(context).isLoading() ? Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,)) :( Provider.of<CardsProvider>(context).cards.isEmpty?Center(child: Text("No Cards To Buy")) :  BuyCardBody()),
        ),
      ),
    );
  }
}
