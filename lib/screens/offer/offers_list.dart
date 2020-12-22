import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:food_app/screens/details/components/offers_list_body.dart';
import 'package:food_app/screens/home/components/offer_types_item.dart';

class OffersList extends StatefulWidget {
  final String title;
  final List <OfferTypesItem> itemsList;
  final List<DateAsc> offerList;

  const OffersList({Key key, this.title , this.itemsList , this.offerList}) : super(key: key);

  @override
  _OffersListState createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold (
          backgroundColor: Colors.grey.withOpacity(0.3),
          appBar: detailsAppBar(titleText: widget.title , buildContext: context , showAction: false),
          bottomNavigationBar: BottomNavBar(),
          body: OffersListBody(itemsList: widget.itemsList,offerList: widget.offerList,),
        ),
      ),
    );
  }
}
