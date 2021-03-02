import 'package:flutter/material.dart';
import 'package:virus/Service/worldService.dart';
import 'package:virus/pages/firstaid.dart';
import 'package:virus/pages/preventpage.dart';
import 'package:virus/pannels/mainpage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
    );
  }
}
