import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/providers/category_provider.dart';
import 'package:food_app/providers/sorted_offers_providers.dart';
import 'package:food_app/screens/offer/offer_card.dart';
import 'package:food_app/screens/offer/offer_details.dart';
import 'package:provider/provider.dart';

class OfferTypesItem extends StatelessWidget {
  final OfferCard offerItem;

  final Offer offer;
  final int index;
  final DateAsc offerType;

  const OfferTypesItem(
      {Key key, this.offerItem, this.offer, this.index, this.offerType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortedOfferProvider = Provider.of<CategoryProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OfferDetails(
                title: "offer",
                item: OfferCard(
                  offerDescription: offerType.engAbout,
                  offerImage: offerType.imageUrl,
                  offerName: offerType.engTitle,
                  resLogo: offerType.outlet.logoUrl,
                ),
                offer: Offer(
                    id: offerType.id,
                    outletId: offerType.outletId,
                    createdAt: offerType.createdAt,
                    price: offerType.price,
                    imageUrl: offerType.imageUrl,
                    arAbout: offerType.arAbout,
                    arTermsAndConditions: offerType.arTermsAndConditions,
                    arTitle: offerType.arTitle,
                    endDate: offerType.endDate,
                    engAbout: offerType.engAbout,
                    engTitle: offerType.engTitle,
                    isValid: offerType.isValid,
                    startDate: offerType.startDate,
                    termsAndConditions: offerType.termsAndConditions,
                    updatedAt: offerType.updatedAt),
                outlet: offerType.outlet,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 10),
        width: 320,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    AppUrl.baseUrlImage +
                        offerType.imageUrl,
                    height: 120,
                    width: 320,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offerType.engTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                       offerType.engAbout,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 80,
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 37,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      AppUrl.baseUrlImage +
                          offerType.outlet.logoUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        offerType.outlet.address,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.5, 0.5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '20% Off',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
