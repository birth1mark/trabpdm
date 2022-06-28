import 'package:flutter/material.dart';
import 'package:trabpdm/screens/components/addpeca.dart';
import 'package:trabpdm/screens/loginscreen.dart';
import '../res/theme.dart';
import 'components/bodypecas.dart';

class PecasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: AddPeca(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
        backgroundColor: colorBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.insert_drive_file_outlined),
            onPressed: () {
              
              
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outlined),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ]);
  }
}
