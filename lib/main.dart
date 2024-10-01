import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/ui/pages/home_page.dart';
//import 'package:store/ui/pages/storePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'efectivamente home',
      ),
    );
  }
}
