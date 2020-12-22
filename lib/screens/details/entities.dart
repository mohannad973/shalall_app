import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:food_app/screens/details/components/entities_list.dart';
import 'package:food_app/screens/home/components/category_item.dart';

class Entities extends StatelessWidget {
  final String title;
  final List<Outlet> outlets;

  const Entities({Key key, this.title,this.outlets}) : super(key: key);


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
          body: EntitiesList(outlets: outlets,),
        ),
      ),
    );
  }
}
