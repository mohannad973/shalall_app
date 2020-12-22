import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/offer_sorted_response.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/screens/offer/offer_card.dart';
import 'package:food_app/screens/offer/offer_details.dart';

class OfferListItem extends StatelessWidget {
  final OfferCard item;
  final DateAsc offer;


  const OfferListItem({Key key, this.item,this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OfferDetails(title : item.offerName , item: item,);
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        AppUrl.baseUrlImage+offer.imageUrl,
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 5.0 , right: 120),
                      child: Text(
                        offer.engTitle ,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          // shadows: <Shadow>[
                          //   Shadow(
                          //     offset: Offset(2.0, 2.0),
                          //     blurRadius: 3.0,
                          //     color: Color.fromARGB(255, 0, 0, 0),
                          //   ),
                          // ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          offer.outlet.address,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
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
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  right: 10,
                  top : 100,
                  child: Container(
                    child: CircleAvatar (
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: ClipRRect (
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(AppUrl.baseUrlImage+offer.outlet.logoUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,),
                      ),
                    ),
                    decoration: BoxDecoration (
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
                Positioned (
                  right: 10,
                  bottom: 5,
                  child : Container (
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration (
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text (
                        '20% Off',
                        style: TextStyle (
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
