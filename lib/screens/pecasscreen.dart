import 'package:flutter/material.dart';
import '../res/theme.dart';
import 'components/bodypecas.dart';
class PecasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar(),
        body:BodyPecas(),);
  }

  AppBar buildAppbar() {
    return AppBar(
          backgroundColor: colorBlue,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {},
          ),
          actions:<Widget>[

           IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          SizedBox(width: 10)
          ]);
  }
}
