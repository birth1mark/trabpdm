import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppPeças',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
