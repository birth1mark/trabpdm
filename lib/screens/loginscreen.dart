import 'package:flutter/material.dart';
import '../res/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'components/login_form.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

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
                    )),
                    FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return LoginForm(focusNode: _uidFocusNode);
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorBlue,
                      ),
                    );
                  },
                )
                  ],
                )),
          ),
        ));
  }
}
