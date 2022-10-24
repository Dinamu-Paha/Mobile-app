import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class lesson_UI extends StatefulWidget {
  const lesson_UI({Key? key}) : super(key: key);

  @override
  State<lesson_UI> createState() => _lesson_UIState();
}

class _lesson_UIState extends State<lesson_UI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('දිනමු පහ - අප අවට සත්තු',),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SubTopic_UI(sub_id: 37,),
                      ));
                },
              ),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("පාඩම", style: TextStyle(fontSize: 16),)),
                  Tab(child: Text("අනුමාන \n  ප්‍රශ්න", style: TextStyle(fontSize: 16),)),
                  Tab(child: Text("     පසුගිය \nවිභාග ප්‍රශ්න", style: TextStyle(fontSize: 16),)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
              ],
            ),
          ),
        )
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfPdfViewer.asset('assets/Pdf/Grade_5_apa_awata_sathun.pdf'),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text('1. පහත රූපවලින් දැක්වෙන වාහන අතර ඇති හොඳම සම්බන්ධතාව මත කාණ්ඩ දෙකකට වෙන් කල හැකි ආකාරය කුමක්ද?',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(image: AssetImage('assets/images/Q1_bus.JPG')),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(image: AssetImage('assets/images/Q2_plane.JPG'))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(image: AssetImage('assets/images/Q3_bike.JPG'))
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(image: AssetImage('assets/images/Q4_chopper.JPG'))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [

                    RadioListTile(
                      title: Text("A, B සහ C, D", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("A, C සහ B, D", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("A, D සහ B, C", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
                      value: "other",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    )
                  ],
                ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('තහවුරු කරන්න', style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text('1. පහත රූපවලින් දැක්වෙන වාහන අතර ඇති හොඳම සම්බන්ධතාව මත කාණ්ඩ දෙකකට වෙන් කල හැකි ආකාරය කුමක්ද?',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(image: AssetImage('assets/images/Q1_bus.JPG')),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(image: AssetImage('assets/images/Q2_plane.JPG'))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(image: AssetImage('assets/images/Q3_bike.JPG'))
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: (MediaQuery.of(context).size.width)/2-30,
                    height: (MediaQuery.of(context).size.width)/2-30,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        image: DecorationImage(image: AssetImage('assets/images/Q4_chopper.JPG'))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [

                  RadioListTile(
                    title: Text("A, B සහ C, D", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("A, C සහ B, D", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("A, D සහ B, C", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
                    value: "other",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 60,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('තහවුරු කරන්න', style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}



