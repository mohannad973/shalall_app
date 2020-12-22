import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/screens/about_us/body.dart';
import 'package:food_app/screens/details/components/app_bar.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String title = 'About Us';

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
          body: AboutUsBody(),
        ),
      ),
    );
  }
}
