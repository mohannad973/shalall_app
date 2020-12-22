import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/providers/offers_provider.dart';
import 'package:food_app/screens/details/components/entity_item.dart';
import 'package:food_app/screens/details/details-screen.dart';
import 'package:food_app/screens/home/components/item_card.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  List<Outlet> outlets;

  ItemList({Key key, this.outlets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: outlets.length,
      itemBuilder: (context, index) =>
          ItemCard(
            svgSrc: AppUrl.baseUrlImage+outlets[index].imageUrl,
            title: outlets[index].engName,
            shopName: outlets[index].engName,
            press: () {

              Provider.of<OffersProvider>(context,listen: false).getOffers(outlets[index].id.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(
                        title: outlets[index].engName,
                        outlet: outlets[index],
                      );
                  },
                ),
              );
            },
          ),
      ),
    );
  }
}



// Row(
// children: <Widget>[
// ItemCard(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// shopName: "MacDonald's",
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return DetailsScreen(
// title: "Beauty",
// item: EntityItem(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty1",
// ));
// },
// ),
// );
// },
// ),
// ItemCard(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// shopName: "Wendys",
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return DetailsScreen(
// title: "Beauty",
// item: EntityItem(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// ));
// },
// ),
// );
// },
// ),
// ItemCard(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// shopName: "MacDonald's",
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return DetailsScreen(
// title: "Beauty",
// item: EntityItem(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// ),
// );
// },
// ),
// );
// },
// ),
// ItemCard(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// shopName: "MacDonald's",
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return DetailsScreen(
// title: "Beauty",
// item: EntityItem(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// ));
// },
// ),
// );
// },
// ),
// ItemCard(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// shopName: "Wendys",
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return DetailsScreen(
// title: "Beauty",
// item: EntityItem(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// ));
// },
// ),
// );
// },
// ),
// ItemCard(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// shopName: "MacDonald's",
// press: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) {
// return DetailsScreen(
// title: "Beauty",
// item: EntityItem(
// svgSrc: "assets/images/res.jpeg",
// title: "Beauty",
// ),
// );
// },
// ),
// );
// },
// ),
// ],
// ),