import 'package:flutter/material.dart';
import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/screens/offer/offer_details.dart';
class OfferCard extends StatelessWidget {
  Offer offer;
  Outlet outlet;


  OfferCard({this.offer,this.outlet});

  @override
  Widget build(BuildContext context) {
    print('offer7 '+offer.toString());
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OfferDetails(title: 'Offers',offer: offer,outlet: outlet,);
            },
          ),
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Center(child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                      image: NetworkImage(AppUrl.baseUrlImage+offer.imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(offer.engTitle,
                    style: TextStyle(fontSize: 20,color: Colors.black),),
                  Text('price : '+offer.price,
                    style: TextStyle(fontSize: 10,color: Colors.black),),

                ],
              ),
            ],
          ))

      ),
    );
  }
}
