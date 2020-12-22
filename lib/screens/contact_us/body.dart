import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class ContactUsBody extends StatefulWidget {
  @override
  _ContactUsBodyState createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row (
            children: [
              Row (
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container (
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration (
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                      size: 20,
                    ),
                  ),
                  SizedBox (width: 20,),
                  Text (
                    'ShlllApp@support.com',
                    style: TextStyle (
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row (
            children: [
              Row (
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container (
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration (
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                      Icons.phone_in_talk,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                  ),
                  SizedBox (width: 20,),
                  Text (
                    '0456433438',
                    style: TextStyle (
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row (
            children: [
              Row (
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container (
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration (
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                      size: 20,
                    ),
                  ),
                  SizedBox (width: 20,),
                  Text (
                    '0999999999',
                    style: TextStyle (
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
