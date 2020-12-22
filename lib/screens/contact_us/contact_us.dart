import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/screens/contact_us/body.dart';
import 'package:food_app/screens/details/components/app_bar.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppBar(showAction: false , titleText: 'Contact Us' , buildContext: context),
      bottomNavigationBar: BottomNavBar(),
      body: ContactUsBody(),
    );
  }
}
