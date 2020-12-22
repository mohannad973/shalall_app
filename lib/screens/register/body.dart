 import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/colors.dart';
import 'package:food_app/components/custom_widget.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/login/body.dart';


class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String country = '';
  @override
  Widget build(BuildContext context) {
    var spacing = MediaQuery.of(context).size.height * .03;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox (height: MediaQuery.of(context).size.height * 0.05,),
            Stack(
              children : [
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: kTextBlackColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton (
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon (Icons.arrow_back_ios),
                    color: kPrimaryColor,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox (height: MediaQuery.of(context).size.height * 0.05,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                      inputTextField(
                        prefixIcon: Icons.person,
                        labelText: 'Name',
                        context: context,
                        hasSuffix: false,
                        isSecure: false,
                        input: TextInputType.name,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      inputTextField(
                        prefixIcon: Icons.email,
                        labelText: 'E-mail',
                        context: context,
                        hasSuffix: false,
                        isSecure: false,
                        input: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      inputTextField(
                        prefixIcon: Icons.phone,
                        labelText: 'Phone',
                        context: context,
                        hasSuffix: false,
                        isSecure: false,
                        input: TextInputType.phone,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      inputTextField(
                        prefixIcon: Icons.remove_red_eye,
                        labelText: 'Password',
                        context: context,
                        hasSuffix: false,
                        isSecure: true,
                        input: TextInputType.text,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      inputTextField(
                        prefixIcon: Icons.remove_red_eye,
                        labelText: 'Confirm Password',
                        context: context,
                        hasSuffix: false,
                        isSecure: true,
                        input: TextInputType.text,
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.6),
                                blurRadius: 1.5,
                                spreadRadius: 1.5,
                              ),
                            ]),
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon (
                              Icons.location_city,
                              size: 25,
                              color: kPrimaryColor,),
                            SizedBox (width: 10,),
                            CountryCodePicker (
                              onChanged: (CountryCode code){
                                setState(() {
                                  country = code.name;
                                });
                              },
                            ),
                            SizedBox (width: 10,),
                            SizedBox (
                              child: Container (
                                width: 2,
                                height: 30,
                                color: kPrimaryColor,
                              ),
                            ),
                            SizedBox (width: 10,),
                            Container (
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text (
                                country,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle (
                                  color: kTextBlackColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: spacing,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 80),
                        height: 60,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
