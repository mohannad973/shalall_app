import 'package:flutter/material.dart';
import 'package:food_app/repositories/my_offers_repository.dart';
import 'package:food_app/screens/my_offers/my_offers_card.dart';


class MyOffersList extends StatefulWidget {
  final List<MyOffersRepository> offersList ;

  const MyOffersList({Key key, this.offersList}) : super(key: key);

  @override
  _MyOffersListState createState() => _MyOffersListState();
}

class _MyOffersListState extends State<MyOffersList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView (
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        children: widget.offersList.map((MyOffersRepository value) {
          return InkWell (
            onTap: (){},
            child: MyOffersCard(),
          );
        }).toList(),
      ),
    );
  }
}
