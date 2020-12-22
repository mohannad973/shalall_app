import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MyOffersCard extends StatefulWidget {
  final MyOffersCard offerItem;

  const MyOffersCard({Key key, this.offerItem}) : super(key: key);

  @override
  _MyOffersCardState createState() => _MyOffersCardState();
}

class _MyOffersCardState extends State<MyOffersCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        Center(
          child: Container(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center (
              child: Container (
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration (
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color:Colors.grey.withOpacity(0.7)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset (1.0 , 1.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top : 10.0 , left: 10 , right: 10),
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text (
                          'fksdhfsdhf',
                      style: TextStyle (
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                      SizedBox(height: 7,),
                      SmoothStarRating(
                        isReadOnly: true,
                        color: Colors.amber,
                        size: 17,
                        rating: 3,
                        starCount: 5,
                        spacing: 4,
                      ),
                      SizedBox(height: 7,),
                      Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Text (
                              'Start :',
                              style: TextStyle (
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox (width: 10,),
                          Text (
                            '17/5/2020',
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Text (
                              'End :',
                              style: TextStyle (
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox (width: 10,),
                          Text (
                            '17/5/2021',
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row (
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon (
                                Icons.location_on,
                                color: kPrimaryColor,
                                size: 16,
                              ),
                              SizedBox(width: 5,),
                              Text ('Saudi Arabia , Jeddah , Street 12',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Container (
                            width: 75,
                            height: 25,
                            decoration: BoxDecoration (
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '20 % Off',
                                style: TextStyle (
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned (
          top: 0,
          right : 0,
          child: Container(
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:Colors.grey.withOpacity(0.7)),
              boxShadow: [
                BoxShadow(
                  offset: Offset (1.0 , 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius : BorderRadius.circular(20),
              child: Image.asset('assets/images/meat.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.fill,),
            ),
          ),
        ),
      ],
    );
  }
}
