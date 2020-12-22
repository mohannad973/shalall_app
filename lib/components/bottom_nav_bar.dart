import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/screens/favourites/whishlist_screen.dart';
import 'package:food_app/screens/favourites/wishList_card.dart';
import 'package:food_app/screens/home/home-screen.dart';
import 'package:food_app/screens/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  int isSelected = 0;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -7),
                blurRadius: 33,
                color: Color(0xFF6DAED9).withOpacity(0.11),
              ),
            ],
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset("assets/icons/home.svg"),
                onPressed: () {
                  setState(() {
                    widget.isSelected = 0;
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Following.svg"),
                onPressed: () {
                  setState(() {
                    // widget.isSelected = 1;
                    // _myPage.jumpToPage(1);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WhishList();
                      },
                    ),
                  );
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/person.svg"),
                onPressed: () {
                  setState(() {
                    widget.isSelected = 3;
                    // _myPage.jumpToPage(3);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Profile();
                      },
                    ),
                  );
                },
              ),
            ],
      ),
    //   body: PageView(
    //   controller: _myPage,
    //   onPageChanged: (int) {
    //     print('Page Changes to index $int');
    //   },
    //   children: <Widget>[
    //     HomeScreen(),
    //     Center(
    //       child: Container(
    //         child: Text('Empty Body 2'),
    //       ),
    //     ),
    //     Profile (),
    //   ],
    //   physics: NeverScrollableScrollPhysics(),
    // ),
    );
  }
}