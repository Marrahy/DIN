import 'package:flutter/material.dart';
import 'package:prac4_sma/screens/home_page.dart';
import 'package:prac4_sma/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.deepOrange;

    return MaterialApp(
      title: 'Material App',
      theme: MyAppTheme.customTheme(primaryColor),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
