import 'package:flutter/material.dart';
import 'package:flutter_razorpay/views/ListData.dart';
import 'package:flutter_razorpay/views/MainHome.dart';
import 'package:flutter_razorpay/views/home.dart';
import 'package:flutter_razorpay/views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Rates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MainHome(),
    );
  }
}
