import 'package:flutter/material.dart';
import '../res/theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _uidFocusNode.unfocus(),
        child: Scaffold(
          
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ Text('PEdro e Ernesto'),SizedBox(height: 20),
                      Text(
                        'FlutterFire',
                        style: TextStyle(
                           
                          fontSize: 40,
                        ),)
                      ],
                    ))
                  ],
                )),
          ),
        ));
  }
}
