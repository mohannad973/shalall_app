import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar detailsAppBar(
    {String titleText, BuildContext buildContext, bool showAction}) {
  return AppBar(
    title: Center(
      child: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(buildContext);
      },
    ),
    actions: <Widget>[
      showAction
          ? IconButton(
              icon: SvgPicture.asset("assets/icons/share.svg"),
              onPressed: () {},
            )
          : IconButton(
              icon: Icon (
                  Icons.search,
              color: Colors.white,
              size: 27,),
              onPressed: () {},
            ),
    ],
  );
}
