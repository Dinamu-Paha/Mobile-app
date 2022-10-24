//import 'dart:html';
import 'package:dinamu_paha/Screens/Add_question.dart';
import 'package:dinamu_paha/Screens/Admin_home.dart';
import 'package:dinamu_paha/Screens/Lesson_UI.dart';
import 'package:dinamu_paha/Screens/Quizzes_&_Games.dart';
import 'package:dinamu_paha/Screens/Sub_subtopic.dart';
import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:dinamu_paha/Screens/studentDash.dart';
import 'package:dinamu_paha/Screens/test.dart';
import 'package:dinamu_paha/slidingGame/Board.dart';
import 'package:flutter/material.dart';
import 'Screens/quizeInside.dart';
import 'Screens/singUp.dart';
import 'Screens/studentProfile.dart';
import 'Screens/subject_UI.dart';
import 'Screens/Sub_topic_UI.dart';
import 'Screens/Quizzes_admin.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'Screens/Main_Subject.dart';
import 'Screens/Quizzes_&_Games.dart';
import 'Screens/Game_1.dart';
import 'Screens/fogotPass.dart';
import 'Screens/studentDash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamu paha',
      theme: ThemeData(
        fontFamily: "KidZone",
        primarySwatch: Colors.blue,
      ),
      home: SubTopic_UI(subject:"sub_name4", image: "assets/images/subtopic_parisaraya_BK.jpg",sub_id: 36),
    );
  }
}
