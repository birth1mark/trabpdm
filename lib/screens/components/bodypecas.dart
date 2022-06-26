import 'package:flutter/material.dart';
import '../../res/theme.dart';
import '../../utils/database.dart';
import 'categories.dart';
class BodyPecas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Categorias",
                style: TextStyle(
                    color: colorOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: "Open Sans"))),
        Categories(),
      ],
    );
  }
}

