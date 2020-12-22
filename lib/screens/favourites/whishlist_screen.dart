import 'package:flutter/material.dart';
import 'package:food_app/providers/favourites_provider.dart';
import 'package:food_app/screens/favourites/wishlist_body.dart';
import 'package:provider/provider.dart';


class WhishList extends StatefulWidget {
  @override
  _WhishListState createState() => _WhishListState();
}

class _WhishListState extends State<WhishList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FavouritesProvider>(context,listen: false).getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    var favouritesProvider = Provider.of<FavouritesProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: favouritesProvider.isLoading()?Center(child: CircularProgressIndicator(backgroundColor: Colors.amber,)):
      WishListBody(favouritesOffers: favouritesProvider.favouritesOffersList,),
    );
  }
}
