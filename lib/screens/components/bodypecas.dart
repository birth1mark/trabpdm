import 'package:flutter/material.dart';
import '../../res/theme.dart';

class BodyPecas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
        Padding(
          
            padding: const EdgeInsets.symmetric(horizontal: 20),
            
            child: Text("Categorias",
                style:TextStyle(color: colorOrange, fontWeight: FontWeight.bold, fontSize: 24, fontFamily:"Open Sans"))),
        Categories(),
      ],
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Motor", "Carroçaria", "Elétrico", "Acessórios"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        categories[index],
        style: TextStyle(fontWeight: FontWeight.bold, color: colorBlue),
      ),
    );
  }
}
