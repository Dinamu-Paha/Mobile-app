import 'package:flutter/material.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Dinamu paha',
      theme: ThemeData(
        fontFamily: "KidZone",
        primarySwatch: Colors.blue,
      ),

      home: HomePage(),
    );
  }
}
