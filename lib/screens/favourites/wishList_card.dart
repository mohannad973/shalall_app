import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/user_favourites_response.dart';
import 'package:food_app/network/app_url.dart';


import '../../constants.dart';

class WishListCard extends StatefulWidget {
FavouriteOffer favouriteOffer;


WishListCard({this.favouriteOffer});

  @override
  _WishListCardState createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width * 0.95,
          color: Colors.transparent,
          child: Card(
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0)),
                    child: Image.network(AppUrl.baseUrlImage+widget.favouriteOffer.offer.imageUrl,
                        alignment: Alignment.centerLeft,fit: BoxFit.fitHeight,height: 100,width: 100,)),
                SizedBox(width: 6,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Text(
                        widget.favouriteOffer.offer.engTitle,
                        style: TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Transform(
                              transform:Matrix4.identity()..scale(0.9),
                              child: Chip(

                                backgroundColor: Colors.amber,
                                label: Text(
                                  widget.favouriteOffer.offer.startDate.toString().substring(0,10),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),

                            Transform(
                              transform: Matrix4.identity()..scale(0.9),
                              child: Chip(
                                backgroundColor: Colors.amber,
                                label: Text(
                                  widget.favouriteOffer.offer.endDate.toString().substring(0,10),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],),

                          Text(widget.favouriteOffer.offer.price+" \$"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
