import 'package:flutter/material.dart';
import 'package:food_app/screens/home/components/discount_card.dart';
import 'package:food_app/screens/home/components/offer_types_item.dart';
import 'package:food_app/screens/offer/offer_details.dart';


class OfferCard extends StatelessWidget {
  final String offerName;
  final String offerImage;
  final String offerDescription;
  final String resLogo;

  const OfferCard({Key key, this.offerName, this.offerImage, this.offerDescription, this.resLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfferTypesItem();
  }
}
