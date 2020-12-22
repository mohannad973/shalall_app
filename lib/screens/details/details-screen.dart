import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:food_app/screens/details/components/body.dart';
import 'package:food_app/screens/details/components/entity_item.dart';
import 'package:food_app/screens/home/components/item_card.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final Outlet item;
  final Outlet outlet;
  const DetailsScreen({Key key, this.title , this.item,this.outlet}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavBar (),
          appBar: detailsAppBar(titleText: title , buildContext: context , showAction: false),
          body: Body(item: item,outlet: outlet,),
        ),
      ),
    );
  }
}
