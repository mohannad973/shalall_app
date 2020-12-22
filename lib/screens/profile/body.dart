import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/user_profile_response_model.dart';

class ProfileBody extends StatefulWidget {
  UserProfile userProfile;

  ProfileBody({this.userProfile});

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 170,),
                  Padding(
                    padding: const EdgeInsets.only(left : 40 , right: 40 , top : 10 , bottom: 20),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container (
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration (
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon (
                                Icons.person,
                                color: kPrimaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox (width: 20,),
                            Column (
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text (
                                  'Name',
                                  style: TextStyle (
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text (
                                  widget.userProfile.firstName+' '+widget.userProfile.lastName,
                                  style: TextStyle (
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox (height: 20,),
                        Row (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container (
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration (
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon (
                                Icons.email,
                                color: kPrimaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox (width: 20,),
                            Column (
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text (
                                  'E-mail',
                                  style: TextStyle (
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text (
                                  widget.userProfile.email,
                                  style: TextStyle (
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox (height: 20,),
                        Row (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container (
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration (
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.9),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon (
                                Icons.mobile_screen_share,
                                color: kPrimaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox (width: 20,),
                            Column (
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text (
                                  'gender',
                                  style: TextStyle (
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text (
                                  widget.userProfile.gender,
                                  style: TextStyle (
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox (height: 20,),
                        // Row (
                        //   mainAxisSize: MainAxisSize.max,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Container (
                        //       height: 80,
                        //       width: 80,
                        //       decoration: BoxDecoration (
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(40),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(0.9),
                        //             spreadRadius: 1,
                        //             blurRadius: 7,
                        //             offset: Offset(0, 3), // changes position of shadow
                        //           ),
                        //         ],
                        //       ),
                        //       child: Icon (
                        //         Icons.shop,
                        //         color: kPrimaryColor,
                        //         size: 30,
                        //       ),
                        //     ),
                        //     SizedBox (width: 20,),
                        //     Column (
                        //       mainAxisSize: MainAxisSize.max,
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text (
                        //           'School',
                        //           style: TextStyle (
                        //             fontSize: 15,
                        //           ),
                        //         ),
                        //         SizedBox(height: 10,),
                        //         Text (
                        //           'Hello',
                        //           style: TextStyle (
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 18,
                        //           ),),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container (
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration (
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200) ,
                  bottomLeft: Radius.circular(200)),
            ),
          ),
          Container(
            height: 190,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top : 30.0),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration (
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
