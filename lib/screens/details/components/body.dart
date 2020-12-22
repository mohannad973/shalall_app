import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Utils/map_util.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/providers/offers_provider.dart';
import 'package:food_app/screens/details/components/entity_item.dart';
import 'package:food_app/screens/details/components/offer_card.dart';
import 'package:food_app/screens/details/components/title_price_rating.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final Outlet item;
  final Outlet outlet;

  const Body({Key key, this.item, this.outlet}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Image.network(
                AppUrl.baseUrlImage + widget.outlet.imageUrl,
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                // color: Colors.yellow,
                // colorBlendMode: BlendMode.darken,
              ),
              ItemInfo(
                item: widget.item,
                outlet: widget.outlet,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: NetworkImage(
                            AppUrl.baseUrlImage + widget.outlet.logoUrl),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(50),
                        //     child: Image.network(
                        //       AppUrl.baseUrlImage+widget.outlet.logoUrl,
                        //
                        //     ),
                        //   ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemInfo extends StatefulWidget {
  final Outlet item;
  final Outlet outlet;

  const ItemInfo({Key key, this.item, this.outlet}) : super(key: key);

  @override
  _ItemInfoState createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    var offersProvider = Provider.of<OffersProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   topRight: Radius.circular(30),
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitlePriceRating(
            name: widget.outlet.engName,
            numOfReviews: 24,
            rating: 3.5,
            onRatingChanged: (value) {},
          ),
          Text(
            '- Description :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              widget.outlet.engDesc,
              style: TextStyle(
                height: 1.5,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '- Information :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              children: [
                Center(
                  child: Text(
                    'Open :',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.outlet.open,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Row(
              children: [
                Center(
                  child: Text(
                    'Close :',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.outlet.close,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '- Contact Us :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.outlet.mobile,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone_android,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.outlet.phone,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          GestureDetector(
            onTap: (){
              MapUtils.openMap(widget.outlet.lat,widget.outlet.long);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.outlet.address,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
              color: Colors.black
          ),
          Text(
            '- Offers :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: size.height * 0.02),

          offersProvider.isLoading()?Center(child: CircularProgressIndicator(backgroundColor: kPrimaryColor,)):
          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
                itemCount: offersProvider.offers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OfferCard(
                    outlet: widget.outlet,
                     offer: offersProvider.offers[index],
                  ),
                );
              })
        ],
      ),
    );
  }

  Row shopName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
