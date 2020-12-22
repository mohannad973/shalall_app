import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/providers/category_provider.dart';
import 'package:food_app/providers/sorted_offers_providers.dart';
import 'package:food_app/screens/home/components/offer_types_item.dart';
import 'package:food_app/screens/offer/offer_card.dart';
import 'package:food_app/screens/offer/offers_list.dart';
import 'package:provider/provider.dart';

class DiscountCard extends StatefulWidget {
  final OfferCard offerItem;
  final Offer offer;
  final List<DateAsc> offersList;
  final String title;
  // final List<OfferTypesItem> itemsList = [
  //   OfferTypesItem (
  //     offerItem: OfferCard (
  //       offerName: 'Test 1',
  //       offerDescription: 'hello 1',
  //       offerImage: 'assets/images/beyond-meat-mcdonalds.png',
  //       resLogo: 'assets/images/res.jpeg',
  //     ),
  //   ),
  //   OfferTypesItem (
  //     offerItem: OfferCard (
  //       offerName: 'Test 2',
  //       offerDescription: 'hello 2',
  //       offerImage: 'assets/images/res.jpeg',
  //       resLogo: 'assets/images/res.jpeg',
  //     ),),
  //   OfferTypesItem (
  //       offerItem: OfferCard (
  //         offerName: 'Test 3',
  //         offerDescription: 'hello 3',
  //         offerImage: 'assets/images/burger1.jpeg',
  //         resLogo: 'assets/images/redCafe.png',
  //       )),
  //   OfferTypesItem (
  //       offerItem: OfferCard (
  //         offerName: 'Test 4',
  //         offerDescription: 'hello 4',
  //         offerImage: 'assets/images/burger2.jpeg',
  //         resLogo: 'assets/images/redCafe.png',
  //       )),
  // ];

  DiscountCard({
    Key key,
    this.offerItem,
    this.offer,
    this.offersList,
    this.title
  }) : super(key: key);

  @override
  _DiscountCardState createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only ( left : 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
              ),
              FlatButton (
                padding: EdgeInsets.all(0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OffersList(title: 'Offers',
                          offerList: widget.offersList,
                          // itemsList: widget.itemsList,
                        );
                      },
                    ),
                  );
                },
                textColor: kPrimaryColor,
                child: Text ('Show All'),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.offersList.length,
            itemBuilder: (context, index) =>
               OfferTypesItem(index: index,offerType: widget.offersList[index],)
          ),
        ),
      ],
    );
  }
}
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row (
// children: widget.itemsList.map((OfferTypesItem value) {
// return OfferTypesItem(
// offerItem: value.offerItem,
// );
// }).toList(),
// ),
// )