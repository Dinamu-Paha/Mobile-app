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
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - ශිෂ්‍යත්ව අත්වැල',),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){},
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Subject_UI_bk.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width-60,
              padding: EdgeInsets.fromLTRB(80, 30, 80, 30),
              height: 400,
              child: Center(
                child: ListView(
                  children: [
                    Container(
                      width: 80,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      color: Colors.amber[600],
                      child: Center(child: Text('Sinhala'),),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      color: Colors.amber[600],
                      child: Center(child: Text('Sinhala'),),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
