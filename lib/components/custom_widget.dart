import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';



Container inputTextField ({BuildContext context , String labelText , IconData prefixIcon , bool hasSuffix , bool isSecure , TextInputType input , FormFieldValidator validator}) {
  return Container (
    height: 60,
    width: MediaQuery.of(context).size.width * .9,
    decoration: BoxDecoration (
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow (
            offset: Offset (1,1),
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 1.5,
            spreadRadius: 1.5,
          ),
        ]
    ),
    child: Center(
      child: TextFormField (
        validator: validator,
        keyboardType: input,
        obscureText: isSecure,
        decoration: InputDecoration (
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            labelText: labelText,
            suffixIcon: hasSuffix ?Icon (
              Icons.arrow_drop_down,
              color: kPrimaryColor,
            ) : Container (width: 10,),
            prefixIcon: Icon(
              prefixIcon,
              size: 25,
              color: kPrimaryColor,)
        ),
      ),
    ),
  );
}