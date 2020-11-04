import 'package:flutter/material.dart';
import 'package:padak_starter/main_page.dart';
import 'package:padak_starter/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MainPage(),
      home: LoginPage(),
    );
  }
}
