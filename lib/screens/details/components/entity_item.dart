import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'dart:ui' as ui;

import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/network/app_url.dart';

class EntityItem extends StatefulWidget {
  final String title, shopName, svgSrc;
  final Function press;
  final TextStyle style;
  final List<Outlet> outlets;
  final String address;
  const EntityItem({Key key, this.title, this.shopName, this.svgSrc, this.press, this.style,this.outlets,this.address}) : super(key: key);
  @override
  _EntityItemState createState() => _EntityItemState();
}

class _EntityItemState extends State<EntityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack (
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(AppUrl.baseUrlImage+widget.svgSrc,
                height: 145,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,),
              ),
              Container (
                width: MediaQuery.of(context).size.width,
                height: 145,
                decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26.withOpacity(0.2),
                ),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text (widget.title,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     shadows: <Shadow>[
                    //       Shadow(
                    //         offset: Offset(2.0, 2.0),
                    //         blurRadius: 3.0,
                    //         color: Color.fromARGB(255, 0, 0, 0),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Text (widget.shopName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon (Icons.location_on,
                          color: kPrimaryColor,),
                        SizedBox (width:2,),
                        Text (widget.address,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );

  }
}
