import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/about_us/about_us.dart';
import 'package:food_app/screens/buy_card/buy_card.dart';
import 'package:food_app/screens/contact_us/contact_us.dart';
import 'package:food_app/screens/my_offers/my_offers.dart';
import 'package:food_app/screens/terms_screen/terms_screen.dart';

class DrawerMenu extends StatelessWidget {
  double textSize = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(125),
                  bottomLeft: Radius.circular(125),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "Sh",
                            style: TextStyle(color: ksecondaryColor),
                          ),
                          TextSpan(
                            text: "ll",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/shll-logo2.png'),

                  ),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
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
          ],
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(left: 10.0, right: 10, top: 20),
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyOffers();
                      },
                    ),
                  );
                },
                leading: Icon(
                  Icons.monetization_on,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'My Offers',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BuyCard();
                      },
                    ),
                  );
                },
                leading: Icon(
                  Icons.credit_card,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'Buy Cards',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsScreen()));
                },
                leading: Icon(
                  Icons.announcement,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AboutUs();
                      },
                    ),
                  );
                },
                leading: Icon(
                  Icons.info,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: kPrimaryColor,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactUs();
                      },
                    ),
                  );
                },
                leading: Icon(
                  Icons.contact_phone,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/youtube.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/linkedin.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/instagram.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/twitter.svg',
                  width: 25,
                  height: 25,
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
