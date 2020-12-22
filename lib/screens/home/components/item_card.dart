import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/constants.dart';

class ItemCard extends StatelessWidget {
  final String title, shopName, svgSrc;
  final Function press;
  const ItemCard({
    Key key,
    this.title,
    this.shopName,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 0, top: 10, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Stack(
              children: [
                Container(
                  width: 175,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      svgSrc,
                      width: 175,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: 175,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black26.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 175,
                  height: 200,
                  child: Center(
                    child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
