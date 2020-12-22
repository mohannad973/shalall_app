import 'package:flutter/material.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/screens/home/components/category_item.dart';

class CategoryList extends StatefulWidget {
  List<CategoryModel> cats;
  int selectedIndex = 0;

  CategoryList({Key key, this.cats}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // List<CategoryItem> items = [
  //   CategoryItem(
  //     title: "Restaurants",
  //     isActive: true,
  //   ),
  //   CategoryItem(
  //     title: "Gyms",
  //     isActive: false,
  //   ),
  //   CategoryItem(
  //     title: "Supermarkets",
  //     isActive: false,
  //   ),
  //   CategoryItem(
  //     title: "Cars",
  //     isActive: false,
  //   ),
  //   CategoryItem(
  //     title: "Restaurants",
  //     isActive: false,
  //   ),
  //   CategoryItem(
  //     title: "Gyms",
  //     isActive: false,
  //   ),
  //   CategoryItem(
  //     title: "Supermarkets",
  //     isActive: false,
  //   ),
  //   CategoryItem(
  //     title: "Cars",
  //     isActive: false,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    print("test1"+widget.selectedIndex.toString());
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: widget.cats.map((CategoryModel value) {
    //       return CategoryItem(
    //         title: value.engName,
    //         selectedIndex:widget.selectedIndex,
    //         press: () {
    //           setState(() {
    //             for (int i = 0; i < items.length ; i++) {
    //               items[i].isActive = false;
    //             }
    //             value.isActive = true;
    //           });
    //         },
    //       );
    //     }).toList(),
    //   ),
    // );
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.cats.length,
      itemBuilder: (context, index) => CategoryItem(
        title: widget.cats[index].engName,
        selectedIndex: widget.selectedIndex,
        index: index,
        press: () {
          setState(() {
            widget.selectedIndex = index;
          });
        },
      ),
    );
  }
}
