import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/card_model.dart';

class CardItem extends StatelessWidget {
  CardModel cardModel;


  CardItem({this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin : EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration (
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column (
          children: [
            Padding(
              padding: const EdgeInsets.only (top : 10.0 , bottom: 20),
              child: Text (
                  cardModel.engName,
              style: TextStyle (
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: kPrimaryColor,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom : 20.0),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row (
                        children: [
                          Icon (
                            Icons.check_circle_outline,
                          color: kPrimaryColor,
                          ),
                          SizedBox (width: 5,),
                          Text (
                              'Valid for',
                          style: TextStyle (
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text (cardModel.numOfMonths),
                    ],
                  ),
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row (
                        children: [
                          Text (
                            'Price',
                            style: TextStyle (
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox (width: 5,),
                          Icon (
                            Icons.check_circle_outline,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text (cardModel.price.toString()+' \$'),
                    ],
                  ),
                ],
              ),
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column (
                  children: [
                    Row (
                      children: [
                        Icon (
                          Icons.check_circle_outline,
                          color: kPrimaryColor,
                        ),
                        SizedBox (width: 5,),
                        Text (
                          'Coupons',
                          style: TextStyle (
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text (cardModel.numOfOffers.toString()),
                  ],
                ),
                Center(
                  child: FlatButton (
                    onPressed: (){},
                    child: Container (
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration (
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center (
                        child: Text ('Buy Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
