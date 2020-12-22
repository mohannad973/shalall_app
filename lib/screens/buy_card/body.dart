import 'package:flutter/material.dart';
import 'package:food_app/providers/cards_provider.dart';
import 'package:food_app/screens/buy_card/card_item.dart';
import 'package:provider/provider.dart';

class BuyCardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder (
        padding: EdgeInsets.all(10),
        itemCount: Provider.of<CardsProvider>(context).cards.length,
        itemBuilder: (context, index) {
          return CardItem(cardModel: Provider.of<CardsProvider>(context).cards[index],);
        },
      ),
    );
  }
}
