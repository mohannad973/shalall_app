import 'package:flutter/material.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/screens/home/components/offer_types_item.dart';
import 'package:food_app/screens/offer/offer_card.dart';
import 'package:food_app/screens/offer/offer_list_item.dart';

class OffersListBody extends StatelessWidget {
  final List <OfferTypesItem> itemsList;
  final List<DateAsc> offerList;

  const OffersListBody({Key key, this.itemsList , this.offerList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
      child:  ListView.builder(
        itemCount: offerList.length,
        itemBuilder: (context, index) =>  OfferListItem(
          offer: offerList[index],
          item: OfferCard(
            resLogo: offerList[index].outlet.logoUrl,
            offerImage: offerList[index].imageUrl,
            offerDescription: offerList[index].engAbout,
            offerName: offerList[index].engTitle,
          ),
        )
      ),
    );
  }
}
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: itemsList.map((OfferTypesItem value) {
// return OfferListItem(
// item: OfferCard(
// resLogo: value.offerItem.resLogo,
// offerImage: value.offerItem.offerImage,
// offerDescription: value.offerItem.offerDescription,
// offerName: value.offerItem.offerName,
// ),
// );
// }).toList(),
// ),


// SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child:
// ),