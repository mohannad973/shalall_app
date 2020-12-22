import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/components/bottom_nav_bar.dart';
import 'package:food_app/components/drawer.dart';
import 'package:food_app/components/search_box.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/providers/cards_provider.dart';

import 'package:food_app/providers/category_provider.dart';
import 'package:food_app/providers/offer_by_date_provider.dart';
import 'package:food_app/screens/home/components/body.dart';
import 'package:provider/provider.dart';
import 'package:food_app/models/category_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Provider.of<CategoryProvider>(context, listen: false).getCategories();


    Provider.of<CardsProvider>(context, listen: false).getCards();

    Provider.of<CategoryProvider>(context, listen: false)
        .getOutletByCategoryId(1);

  }

  List<CategoryModel> cats;
  List<Outlet> outlets;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            drawer: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Drawer(
                elevation: 1,
                child: DrawerMenu(),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/menu.svg",
                    color: kPrimaryColor,
                  ),
                  color: kPrimaryColor,
                  onPressed: () => _scaffoldKey.currentState.openDrawer()),
              title: RichText(
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
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: SvgPicture.asset("assets/icons/notification.svg"),
                  onPressed: () {},
                ),
              ],
            ),
            bottomNavigationBar: BottomNavBar(),
            body:
                //
                SingleChildScrollView(
              child: Column(
                children: [
                   SearchBox(),
                  FutureBuilder(
                    future:
                        Provider.of<CategoryProvider>(context, listen: false)
                            .getCategories(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('something went wrong'),
                          );
                        }
                        cats = snapshot.data.categories;
                        print('cats test' + cats.toString());
                        return Body(
                          cats: cats,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.yellow,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

//
// return FutureBuilder (
// future: Provider.of<CategoryProvider>(context).getOutletByCategoryId(cats[0].id),
// builder: (BuildContext context, AsyncSnapshot snapshot){
// if(snapshot.connectionState == ConnectionState.done){
// if(snapshot.hasError){
// return Container(
// child: Text('something went wrong'),
// );
// }
// outlets = snapshot.data.outlets;
// print("........."+outlets.toString());
// return Body(cats: cats,outlets: outlets, firstCategoryId: cats[0].id,);
// }else{
// return Center(
// child: CircularProgressIndicator(
// backgroundColor: Colors.yellow,
// ),
// );
// }
//
// },
// );

//
//
// FutureBuilder(
// future: Provider.of<CategoryProvider>(context, listen: false)
// .getCategories(),
// builder: (BuildContext context, AsyncSnapshot snapshot) {
// if (snapshot.connectionState == ConnectionState.done) {
// if (snapshot.hasError) {
// return Container(
// child: Text('something went wrong'),
// );
// }
// cats = snapshot.data.categories;
// print("**********"+cats.toString());
// return Body(cats: cats,);
//
// } else {
// return Center(
// child: CircularProgressIndicator(
// backgroundColor: Colors.yellow,
// ),
// );
// }
// },
// )
