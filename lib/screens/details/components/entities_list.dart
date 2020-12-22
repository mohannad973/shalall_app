import 'package:flutter/material.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/screens/details/components/entity_item.dart';
import 'package:food_app/screens/details/details-screen.dart';
import 'package:food_app/screens/home/components/category_item.dart';
import 'package:food_app/screens/home/components/item_card.dart';
import 'package:food_app/screens/offer/offer_details.dart';

class EntitiesList extends StatefulWidget {
  List<Outlet> outlets;

  EntitiesList({this.outlets});

  @override
  _EntitiesListState createState() => _EntitiesListState();
}

class _EntitiesListState extends State<EntitiesList> {
  List<EntityItem> items = [
    EntityItem(
      svgSrc: "assets/images/res.jpeg",
      title: "Beauty",
      shopName: "MacDonald's",
      press: () {},
    ),
    EntityItem(
      svgSrc: "assets/images/res.jpeg",
      title: "Beauty",
      shopName: "Wendys",
      press: () {},
    ),
    EntityItem(
      svgSrc: "assets/images/res.jpeg",
      title: "Beauty",
      shopName: "MacDonald's",
      press: () {},
    ),
    EntityItem(
      svgSrc: "assets/images/res.jpeg",
      title: "Beauty",
      shopName: "MacDonald's",
      press: () {},
    ),
    EntityItem(
      svgSrc: "assets/images/res.jpeg",
      title: "Beauty",
      shopName: "Wendys",
      press: () {},
    ),
    EntityItem(
      svgSrc: "assets/images/res.jpeg",
      title: "Beauty",
      shopName: "MacDonald's",
      press: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 10.0 , left: 10 , right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.outlets.map((Outlet value) {
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailsScreen(title : value.engName, item: value,outlet: value,);
                    },
                  ),
                );
              },
              child: EntityItem(
                shopName: value.engName,
                title: value.engName,
                svgSrc: value.imageUrl,
                address: value.address,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
