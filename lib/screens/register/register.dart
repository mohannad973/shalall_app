import 'package:flutter/material.dart';
import 'package:food_app/screens/register/body.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterBody(),
    );
  }
}
