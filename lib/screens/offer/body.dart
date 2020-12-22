import 'package:flutter/material.dart';
import 'package:food_app/models/offer_model.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';
import 'package:food_app/providers/add_to_favourates_provider.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/details/components/title_price_rating.dart';
import 'package:food_app/screens/offer/offer_card.dart';
import 'package:provider/provider.dart';

class OfferBody extends StatefulWidget {
  final OfferCard item;
  final Outlet outlet;
  final Offer offer;


  const OfferBody({Key key, this.item, this.offer, this.outlet})
      : super(key: key);

  @override
  _OfferBodyState createState() => _OfferBodyState();
}

class _OfferBodyState extends State<OfferBody> {

  @override
  Widget build(BuildContext context) {
    // widget.outlet==null?print('outletNull'): print('outletd '+widget.outlet.toString());
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Image.network(
                AppUrl.baseUrlImage + widget.offer.imageUrl,
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              OfferItemInfo(
                offerItem: widget.item,
                offer: widget.offer,
                outlet: widget.outlet,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 205,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: Image.network(
                                AppUrl.baseUrlImage + widget.outlet.logoUrl,
                                width: 90,
                                height: 90,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                bool added =
                                    await Provider.of<AddFavouritesProvider>(
                                            context,
                                            listen: false)
                                        .addToFav(widget.offer.id.toString());
                                if(added){
                                  _showToast(context);
                                }
                                setState(() {});
                              },
                              child: Icon(
                                Icons.favorite_border,
                                color: kPrimaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 75,
                              height: 25,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  widget.offer.engTitle,
                                  style: TextStyle(
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OfferItemInfo extends StatefulWidget {
  final OfferCard offerItem;
  final Offer offer;
  final Outlet outlet;

  const OfferItemInfo({Key key, this.offerItem, this.offer, this.outlet})
      : super(key: key);

  @override
  _OfferItemInfoState createState() => _OfferItemInfoState();
}

class _OfferItemInfoState extends State<OfferItemInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TitlePriceRating(
            name: '',
            rating: 2,
            // onRatingChanged: (value) {},
          ),
          Text(
            '- About :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.offer.engAbout,
            style: TextStyle(
              height: 1.5,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '- Terms And Conditions :',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.offer.termsAndConditions,
            style: TextStyle(
              height: 1.5,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '- Information :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  'Start :',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.offer.startDate.toString().substring(0, 10),
                maxLines: 2,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  'End :  ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.offer.endDate.toString().substring(0, 10),
                maxLines: 2,
              ),
            ],
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
                    widget.outlet.phone,
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
                    widget.outlet.mobile,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: FlatButton(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: () {},
              color: kPrimaryColor,
              textColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Text(
                'Redeem',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Offer Added To Favourites'),
    ),
  );
}