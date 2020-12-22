import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paginator/flutter_paginator.dart';
import 'package:food_app/Utils/session_manager.dart';
import 'package:food_app/components/search_box.dart';
import 'package:food_app/constants.dart';

import 'package:food_app/models/category_model.dart';
import 'package:food_app/models/getcategory_response.dart';
import 'package:food_app/models/outlet_model.dart';
import 'package:food_app/providers/category_provider.dart';
import 'package:food_app/screens/details/entities.dart';
import 'package:food_app/screens/home/components/category_list.dart';
import 'package:food_app/screens/home/components/discount_card.dart';
import 'package:food_app/screens/home/components/item_list.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'category_item.dart';

class Body extends StatefulWidget {
  List<CategoryModel> cats;
  int selectedIndex = 0;


  Body({this.cats, this.selectedIndex});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<PaginatorState> paginatorGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SearchBox(),

          SizedBox(
            height: 4,
          ),
          //
          //  Provider.of<CategoryProvider>(context).isLoading()?Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,)):
          Container(
            height: 39,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.cats.length,
              itemBuilder: (context, index) => CategoryItem(
                title: widget.cats[index].engName,
                selectedIndex: widget.selectedIndex,
                index: index,
                press: () {
                  setState(() {
                    widget.selectedIndex = index;

                    Provider.of<CategoryProvider>(context,listen: false)
                        .getOutletByCategoryId(
                            Provider.of<CategoryProvider>(context,listen: false)
                                .categories[widget.selectedIndex]
                                .id);
                  });
                },
              ),
            ),
          ),
          Container(
            color: itemsListColor.withOpacity(0.05),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Entities(
                            title: 'Restaurants',
                            outlets: Provider.of<CategoryProvider>(context).outlets,
                            // outlets:(widget.selectedIndex == null)? widget.cats[0].outlets:widget.cats[widget.selectedIndex].outlets,
                          );
                        },
                      ),
                    );
                  },
                  textColor: kPrimaryColor,
                  child: Text('Show All'),
                )
              ],
            ),
          ),

         Provider.of<CategoryProvider>(context,listen: true).isOutletLoading()?Container(height:170,child: Center(child: CircularProgressIndicator(backgroundColor: Colors.amber,))):
          Container(
              height: 170,
              child: (widget.selectedIndex == null)
                  ? ItemList(
                       outlets: Provider.of<CategoryProvider>(context).outlets,
                      )
                  : ItemList(
                       outlets:  Provider.of<CategoryProvider>(context).outlets,
                       // widget.cats[widget.selectedIndex].outlets,
                      )),
          SizedBox(
            height: 10,
          ),
          DiscountCard(offersList: Provider.of<CategoryProvider>(context).datesOffers,title: "last offers",),
          DiscountCard(offersList: Provider.of<CategoryProvider>(context).sellOffers,title: "best sells",),
          DiscountCard(offersList: Provider.of<CategoryProvider>(context).favOffers,title: "user favourites"),
          DiscountCard(offersList: Provider.of<CategoryProvider>(context).rateOffers,title: "most liked"),
          // DiscountCard(),
        ],
      ),
    );
  }
}

//
// Future<CategoryResponseModel> sendCategoriesRequest(int page) async {
//   print("111111");
//   try {
//     UserPreferences userPreferences = UserPreferences();
//     String token = await userPreferences.getToken();
//     String url = Uri.encodeFull(
//         'https://shllonline.com/api/getAllCategories?page=$page');
//     http.Response response = await http.post(url, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     print("data"+categoryResponseModelFromJson(response.body).toString());
//     return categoryResponseModelFromJson(response.body);
//   } catch (e) {
//     if (e is IOException) {
//       return CategoryResponseModel.withError(
//           'Please check your internet connection.');
//     } else {
//       print(e.toString());
//       return CategoryResponseModel.withError('Something went wrong.');
//     }
//   }
// }
//
// List<dynamic> listItemsGetter(CategoryResponseModel categoryResponseModel) {
//   print("222222");
//
//   List<String> list = [];
//   categoryResponseModel.categories.data.forEach((value) {
//
//     list.add(value.engName);
//   });
//   return list;
// }
//
// Widget listItemBuilder(value, int index) {
//   print("333333");
//
//
//
//
//   return GestureDetector(
//
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       child: Column(
//         children: <Widget>[
//           Text(
//             value,
//             style: 0==index
//                 ? TextStyle(
//               color: kPrimaryColor,
//               fontWeight: FontWeight.bold,
//             )
//                 : TextStyle(fontSize: 12),
//           ),
//           if(0== index )
//
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 5),
//               height: 3,
//               width: 22,
//               decoration: BoxDecoration(
//                 color: kPrimaryColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ) ,
//         ],
//       ),
//     ),
//   );
// }
//
// Widget loadingWidgetMaker() {
//   print("444444");
//   return Container(
//     alignment: Alignment.center,
//     height: 160.0,
//     child: CircularProgressIndicator(backgroundColor: Colors.teal,),
//   );
// }
//
// Widget errorWidgetMaker(CategoryResponseModel categoriesData, retryListener) {
//   print("555555");
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(categoriesData.errorMessage),
//       ),
//       FlatButton(
//         onPressed: retryListener,
//         child: Text('Retry'),
//       )
//     ],
//   );
// }
//
// Widget emptyListWidgetMaker(CategoryResponseModel categoriesData) {
//   print("666666");
//   return Center(
//     child: Text('No Categories found'),
//   );
// }
//
// int totalPagesGetter(CategoryResponseModel categoriesData) {
//   print("7777777");
//   return categoriesData.categories.data.length;
// }
//
// bool pageErrorChecker(CategoryResponseModel categoryResponseModel) {
//   print("888888");
//   print("9999"+categoryResponseModel.categories.toString());
//   return categoryResponseModel.categories == null;
// }

//
// ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: widget.cats.length,
// itemBuilder: (context, index) =>
// CategoryItem(
// title: widget.cats[index].engName,
// selectedIndex: widget.selectedIndex,
// index: index,
// press: () {
// setState(() {
// widget.selectedIndex = index;
// });
// },
// ),
// ),
