import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Utils/validators.dart';
import 'package:food_app/components/colors.dart';
import 'package:food_app/components/custom_widget.dart';
import 'package:food_app/components/decorations.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/userAuthentication/login_response.dart';
import 'package:food_app/models/userAuthentication/user_info.dart';
import 'package:food_app/providers/Auth_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/home-screen.dart';
import 'package:food_app/screens/register/register.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool _visible = false;
  final formKey = new GlobalKey<FormState>();

  String _email, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    var doLogin = () {
      final form = formKey.currentState;

      if (form.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            auth.login(_email, _password);

        successfulMessage.then((response) {
          if (response['status']) {
            LoginResponse user = response['user'];
          //  Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen()));
            //  Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        print("form is invalid");
      }
    };
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .1,
              color: Colors.white,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "Shl",
                      style: TextStyle(color: ksecondaryColor, fontSize: 80),
                    ),
                    TextSpan(
                      text: "ll",
                      style: TextStyle(color: kPrimaryColor, fontSize: 80),
                    ),
                  ],
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: containerFieldDecoration(),
                    child: Center(
                      child: TextFormField(
                        validator: emailValidator(_email),
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        decoration: customInputDecoration(
                          prefixIcon: Icons.person,
                          labelText: 'Name',
                          hasSuffix: false,
                        ),
                        onChanged: (val) {
                          setState(() => _email = val);
                        },
                        onSaved: (value) => _email = value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: containerFieldDecoration(),
                    child: Center(
                      child: TextFormField(
                        validator: passwordValidator(),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: customInputDecoration(
                          prefixIcon: Icons.remove_red_eye,
                          labelText: 'Password',
                          context: context,
                          hasSuffix: false,
                          input: TextInputType.text,
                        ),
                        onChanged: (val) {
                          setState(() => _password = val);
                        },
                        onSaved: (value) => _password = value,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .065,
                  ),
                  auth.loggedInStatus == Status.Authenticating
                      ? loading
                      : Container(
                          margin: EdgeInsets.only(bottom: 30),
                          height: 60,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              doLogin();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomeScreen()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have account yet .',
                          style: TextStyle(
                            color: kTextBlackColor,
                            fontSize: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            ' Register',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerPainter extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kPrimaryColor
      ..style = PaintingStyle.fill;

    final path = new Path()
      ..moveTo(size.width * .9, 0)
      ..quadraticBezierTo(
          size.width, size.height * 0.3, size.width * 0.6, size.height * 0.25)
      ..quadraticBezierTo(
          size.width * 0.05, size.height * 0.2, size.width * .2, size.height)
      ..quadraticBezierTo(size.width, size.height, 0, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ContainerPainter oldDelegate) => true;
}
