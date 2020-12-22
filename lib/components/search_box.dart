import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/constants.dart';

class SearchBox extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    Key key,
    this.onChanged,
  }) : super(key: key);


  @override
  _SearchBoxState createState() => _SearchBoxState();
}


class _SearchBoxState extends State<SearchBox> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: ksecondaryColor.withOpacity(0.32),
        ),
      ),
      child: TextFormField(
        key: _formKey,
          onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/icons/search.svg",
          color: kPrimaryColor,),
          hintText: "Search Here",
          hintStyle: TextStyle(color: ksecondaryColor),
        ),
      ),
    );
  }
}
