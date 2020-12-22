import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/user_favourites_response.dart';
import 'package:food_app/providers/Auth_provider.dart';
import 'package:food_app/providers/add_to_favourates_provider.dart';
import 'package:food_app/providers/app_info_provider.dart';
import 'package:food_app/providers/cards_provider.dart';
import 'package:food_app/providers/category_provider.dart';
import 'package:food_app/providers/favourites_provider.dart';
import 'package:food_app/providers/offer_by_date_provider.dart';
import 'package:food_app/providers/offers_provider.dart';
import 'package:food_app/providers/sorted_offers_providers.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/home-screen.dart';
import 'package:food_app/screens/login/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    child:MyApp() ,
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<UserProfileProvider>(create: (_) => UserProfileProvider()),
      ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
      ChangeNotifierProvider<CardsProvider>(create: (_) => CardsProvider()),
      ChangeNotifierProvider<FavouritesProvider>(create: (_) => FavouritesProvider()),
      ChangeNotifierProvider<OffersProvider>(create: (_) => OffersProvider()),
      ChangeNotifierProvider<AddFavouritesProvider>(create: (_) => AddFavouritesProvider()),
      ChangeNotifierProvider<OffersByDateProvider>(create: (_) => OffersByDateProvider()),
      ChangeNotifierProvider<SortedOffersProvider>(create: (_) => SortedOffersProvider()),
      ChangeNotifierProvider<AppInfoProvider>(create: (_) => AppInfoProvider()),
    ],

  )
   );

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          body1: TextStyle(color: ksecondaryColor),
          body2: TextStyle(color: ksecondaryColor),
        ),
      ),
      home: Login(),
    );
  }
}
