import 'package:flutter/material.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/details/components/app_bar.dart';
import 'package:food_app/screens/profile/body.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String title = 'Profile';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProfileProvider>(context,listen: false).getUserProfile();
  }
  @override
  Widget build(BuildContext context) {
    var userProfileProvider = Provider.of<UserProfileProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold (
          backgroundColor: Colors.white,
          appBar: detailsAppBar(titleText: title , buildContext: context , showAction: false),
          bottomNavigationBar: BottomNavBar(),
          body:
              userProfileProvider.isLoading()?Center(child: CircularProgressIndicator(backgroundColor: Colors.amber,)):
          ProfileBody(userProfile: userProfileProvider.userProfile,),
        ),
      ),
    );
  }
}
