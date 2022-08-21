import 'package:dinamu_paha/Screens/Add_question.dart';
import 'package:dinamu_paha/Screens/Admin_home.dart';
import 'package:dinamu_paha/Screens/Lesson_UI.dart';
import 'package:dinamu_paha/Screens/Quizzes_admin.dart';
import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:dinamu_paha/Screens/singUp.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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


      home:lesson_UI(),
    );
  }
}
