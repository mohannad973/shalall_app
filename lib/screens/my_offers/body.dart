import 'package:flutter/material.dart';
import 'package:food_app/repositories/my_offers_repository.dart';
import 'package:food_app/screens/my_offers/my_offers_list.dart';


class MyOffersBody extends StatefulWidget {
  List<MyOffersRepository> offersList =[
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
    MyOffersRepository('name 1', 'assets/images/redCafe.png', 'test test ', 'assets/res.jpeg',),
  ];

  @override
  _MyOffersBodyState createState() => _MyOffersBodyState();
}

class _MyOffersBodyState extends State<MyOffersBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: MyOffersList(offersList: widget.offersList,),
    );
  }
}
