import 'package:flutter/material.dart';
import 'package:food_app/models/user_favourites_response.dart';
import 'package:food_app/screens/favourites/wishList_card.dart';
import 'package:provider/provider.dart';

class WishListBody extends StatefulWidget {
  List<FavouriteOffer> favouritesOffers;

  WishListBody({this.favouritesOffers});

  @override
  _WishListBodyState createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.favouritesOffers.length,
      itemBuilder: (context, index) =>WishListCard(favouriteOffer: widget.favouritesOffers[index],)
    );
  }
}
