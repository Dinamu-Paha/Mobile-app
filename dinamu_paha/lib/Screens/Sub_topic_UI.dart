import 'package:flutter/material.dart';

class SubTopic_UI extends StatefulWidget {
  const SubTopic_UI({Key? key}) : super(key: key);

  @override
  State<SubTopic_UI> createState() => _SubTopic_UIState();
}

class _SubTopic_UIState extends State<SubTopic_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('දිනමු පහ - ශිෂ්‍යත්ව අත්වැල',),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){},
            ),
          ),
    ),
    );
  }
}
