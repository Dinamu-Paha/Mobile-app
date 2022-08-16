import 'package:flutter/material.dart';

class Subject_UI extends StatefulWidget {
  const Subject_UI({Key? key}) : super(key: key);

  @override
  State<Subject_UI> createState() => _Subject_UIState();
}

class _Subject_UIState extends State<Subject_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dinamu paha - Maths',),
          leading: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Material(
                  shape: CircleBorder(),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
