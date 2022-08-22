import 'package:dinamu_paha/Screens/landing.dart';
import 'package:dinamu_paha/Screens/quizers_student.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: LandingPage());
  }
}
