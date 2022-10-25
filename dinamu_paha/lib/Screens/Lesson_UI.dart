import 'package:dinamu_paha/Screens/Sub_topic_UI.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../Component/colors.dart';
import 'Quizzes_&_Games.dart';
import 'package:http/http.dart' as http;


class lesson_UI extends StatefulWidget {
  var sub_id;
  var sub_topic_id;
  lesson_UI({Key? key, this.sub_id, this.sub_topic_id }) : super(key: key);

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
                FirstScreen(sub_id : widget.sub_id, sub_topic_id : widget.sub_topic_id),
                SecondScreen(sub_id : widget.sub_id, sub_topic_id : widget.sub_topic_id),
                ThirdScreen(sub_id : widget.sub_id, sub_topic_id : widget.sub_topic_id),
              ],
            ),
          ),
        )
    );
  }
}

class FirstScreen extends StatefulWidget {
  var sub_id;
  var sub_topic_id;
  FirstScreen({Key? key, this.sub_id, this.sub_topic_id}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfPdfViewer.network('http://192.168.1.102:8080/get/image/'+widget.sub_id.toString()+widget.sub_topic_id.toString()+'.pdf'),
    );
  }
}

class SecondScreen extends StatefulWidget {
  var sub_topic;
  var sub_id;
  var sub_topic_id;
  SecondScreen({Key? key, this.sub_topic, this.sub_id, this.sub_topic_id}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // get questions
  List _correctAnswerList  = new List.filled(30, null, growable: false);
  List _selectAnswerList  = new List.filled(30, 5, growable: false);

  Future <List<dynamic>> getQuestions()async {
    final res = await http.get(
        Uri.parse('http://192.168.1.102:8080/question/getquestion'+widget.sub_id.toString()+'/'+widget.sub_topic_id.toString())
      // headers: {'Content-Type': 'application/json'}
    );
    List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
    _globalIndex = responsejson.length;
    // print(responsejson);
    for(var j = 0;j< _globalIndex; j++){
      _dbAnswers[j] = responsejson[j]["correctAns"];
    }

    activateButton();

    return responsejson;
  }

  // get correct marks
  int _globalIndex = 0;
  bool _buttonDisabled = false;
  int _noOfCorrectAnswers = 0;
  List _dbAnswers  = new List.filled(30, Null, growable: false);
  int _finalMarks = 0;

  activateButton(){
    if(_globalIndex== null||_globalIndex== 0){
      _buttonDisabled = false;
    }else _buttonDisabled=true;
  }

  onSubmit(){

  }

  //Timeout popup
  Future<void> openDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Time out.",
                        style: TextStyle(
                          color: Colors.red, fontSize: 22,
                        ),),
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Quiz_Games(),));
                    },
                    child: Container(
                      width: 125,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColor.btnColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Go to Quizzers",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  //popup
  Future<void> SubmitPopup(int _finalMarks ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Container(
                    height: 80,
                    child: Center(
                      child: Text(("You got : "+ _finalMarks.toString()+" Marks"), style: TextStyle(color: Colors.red, fontSize: 22,),),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Quiz_Games(),));
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                              "ok",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Timeout popup
  Future<void> openDialogBackConfirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Container(
                    height: 80,
                    child: Center(
                      child: Text(
                        "Are you sure",
                        style: TextStyle(
                          color: Colors.red, fontSize: 22,
                        ),),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Quiz_Games(),));
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            children: [
              FutureBuilder<List<dynamic>>(
                future: getQuestions(),
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){
                  if(snapshot.hasData){
                    return Expanded(
                      child: ListView.builder(itemCount: snapshot.data?.length ,itemBuilder: (context, index){
                        return Card(
                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),
                              Text(snapshot.data?[index]["prescription"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 22),),
                              Text(snapshot.data?[index]["postcription"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 22),),

                              SizedBox(height: 10,),

                              RadioListTile(
                                selected: false,
                                value: 1,
                                groupValue: _selectAnswerList[index],
                                onChanged: ( value){
                                  setState(() {
                                    _selectAnswerList[index]= value;
                                    // v1 = value;
                                    // ind1 = index + 1;
                                    _correctAnswerList[index] = value;
                                    print(_correctAnswerList[index]);
                                    print(_correctAnswerList);
                                  });
                                },
                                title: Text(snapshot.data?[index]["ans1"] ?? "",style: TextStyle(fontFamily: 'poppins', fontSize: 20),),
                              ),
                              RadioListTile(
                                selected: false,
                                value: 2,
                                groupValue: _selectAnswerList[index],
                                onChanged: (value){
                                  setState(() {
                                    _selectAnswerList[index]= value;
                                    // v1 = value;
                                    // ind1 = index + 1;
                                    _correctAnswerList[index] = value;
                                    print(_correctAnswerList[index]);
                                    print(_correctAnswerList);
                                  });
                                },
                                title: Text(snapshot.data?[index]["ans2"] ?? "",style: TextStyle(fontFamily: 'poppins', fontSize: 20),),
                              ),
                              RadioListTile(
                                selected: false,
                                value: 3,
                                groupValue: _selectAnswerList[index],
                                onChanged: ( value){
                                  setState(() {
                                    _selectAnswerList[index]= value;
                                    // v1 = value;
                                    // ind1 = index + 1;
                                    _correctAnswerList[index] = value;
                                    print(_correctAnswerList[index]);
                                    print(_correctAnswerList);
                                  });
                                },
                                title: Text(snapshot.data?[index]["ans3"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 20),),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        );
                      }),
                    );
                  } else return Container(
                    child: Center(
                        child: Text("Loading...")
                    ),
                  );

                },
              ),
              Row(
                children: [
                  SizedBox(width: 120,),
                  ElevatedButton(
                      onPressed: _buttonDisabled?(){
                        print(_globalIndex);
                        print(_selectAnswerList[0]);
                        print(_dbAnswers[0]);

                        for(int i=0; i < _globalIndex;i++){
                          if(_selectAnswerList[i]==_dbAnswers[i]){
                            print("_noOfCorrectAnswers");
                            ++_noOfCorrectAnswers;
                          }
                        }
                        _finalMarks=(_noOfCorrectAnswers / _globalIndex*100).round();
                        SubmitPopup(_finalMarks);
                        print(_noOfCorrectAnswers);
                        print(_finalMarks);
                        print("Elevated Button One pressed");
                        _noOfCorrectAnswers=0;
                        _finalMarks =0;
                      }:null,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text('Submit', style: TextStyle(fontFamily: 'poppins', fontSize: 25),),
                      )
                  )
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

// class _SecondScreenState extends State<SecondScreen> {
//   String? gender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//     );
//     //   SingleChildScrollView(
//     //   child: Container(
//     //     child: Column(
//     //       children: [
//     //         SizedBox(height: 40,),
//     //         Container(
//     //           margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//     //           child: Text('1. පහත රූපවලින් දැක්වෙන වාහන අතර ඇති හොඳම සම්බන්ධතාව මත කාණ්ඩ දෙකකට වෙන් කල හැකි ආකාරය කුමක්ද?',
//     //             style: TextStyle(fontSize: 20),),
//     //         ),
//     //         SizedBox(height: 30,),
//     //         Container(
//     //           margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//     //           child: Row(
//     //             children: [
//     //               Container(
//     //                 width: (MediaQuery.of(context).size.width)/2-30,
//     //                 height: (MediaQuery.of(context).size.width)/2-30,
//     //                 decoration: BoxDecoration(
//     //                   border: Border.all(color: Colors.black, width: 2),
//     //                   image: DecorationImage(image: AssetImage('assets/images/Q1_bus.JPG')),
//     //                 ),
//     //               ),
//     //               SizedBox(width: 20,),
//     //               Container(
//     //                 width: (MediaQuery.of(context).size.width)/2-30,
//     //                 height: (MediaQuery.of(context).size.width)/2-30,
//     //                 decoration: BoxDecoration(
//     //                     border: Border.all(color: Colors.black, width: 2),
//     //                     image: DecorationImage(image: AssetImage('assets/images/Q2_plane.JPG'))
//     //                 ),
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //         SizedBox(height: 20,),
//     //         Container(
//     //           margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//     //           child: Row(
//     //             children: [
//     //               Container(
//     //                 width: (MediaQuery.of(context).size.width)/2-30,
//     //                 height: (MediaQuery.of(context).size.width)/2-30,
//     //                 decoration: BoxDecoration(
//     //                     border: Border.all(color: Colors.black, width: 2),
//     //                     image: DecorationImage(image: AssetImage('assets/images/Q3_bike.JPG'))
//     //                 ),
//     //               ),
//     //               SizedBox(width: 20,),
//     //               Container(
//     //                 width: (MediaQuery.of(context).size.width)/2-30,
//     //                 height: (MediaQuery.of(context).size.width)/2-30,
//     //                 decoration: BoxDecoration(
//     //                     border: Border.all(color: Colors.black, width: 2),
//     //                     image: DecorationImage(image: AssetImage('assets/images/Q4_chopper.JPG'))
//     //                 ),
//     //               ),
//     //             ],
//     //           ),
//     //         ),
//     //         SizedBox(height: 20,),
//     //         Container(
//     //             margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
//     //             child: Column(
//     //               children: [
//     //
//     //                 RadioListTile(
//     //                   title: Text("A, B සහ C, D", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
//     //                   value: "male",
//     //                   groupValue: gender,
//     //                   onChanged: (value){
//     //                     setState(() {
//     //                       gender = value.toString();
//     //                     });
//     //                   },
//     //                 ),
//     //
//     //                 RadioListTile(
//     //                   title: Text("A, C සහ B, D", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
//     //                   value: "female",
//     //                   groupValue: gender,
//     //                   onChanged: (value){
//     //                     setState(() {
//     //                       gender = value.toString();
//     //                     });
//     //                   },
//     //                 ),
//     //
//     //                 RadioListTile(
//     //                   title: Text("A, D සහ B, C", style: TextStyle(fontFamily: 'Poppins', fontSize: 20),),
//     //                   value: "other",
//     //                   groupValue: gender,
//     //                   onChanged: (value){
//     //                     setState(() {
//     //                       gender = value.toString();
//     //                     });
//     //                   },
//     //                 )
//     //               ],
//     //             ),
//     //         ),
//     //         SizedBox(height: 20,),
//     //         Container(
//     //           height: 60,
//     //           width: 220,
//     //           decoration: BoxDecoration(
//     //             color: Colors.blue,
//     //             borderRadius: BorderRadius.circular(10)
//     //           ),
//     //           child: Center(child: Text('තහවුරු කරන්න', style: TextStyle(fontSize: 25, color: Colors.white),)),
//     //         ),
//     //         SizedBox(height: 40,),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }

class ThirdScreen extends StatefulWidget {
  var sub_topic;
  var sub_id;
  var sub_topic_id;
  ThirdScreen({Key? key, this.sub_topic, this.sub_id, this.sub_topic_id}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  // get questions
  List _correctAnswerList  = new List.filled(30, null, growable: false);
  List _selectAnswerList  = new List.filled(30, 5, growable: false);

  Future <List<dynamic>> getQuestions()async {
    final res = await http.get(
        Uri.parse('http://192.168.43.90:8080/question/getquestionsofquiz/quiz1')
      // headers: {'Content-Type': 'application/json'}
    );
    List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
    _globalIndex = responsejson.length;
    // print(responsejson);
    for(var j = 0;j< _globalIndex; j++){
      _dbAnswers[j] = responsejson[j]["correctAns"];
    }

    activateButton();

    return responsejson;
  }

  //popup
  Future<void> SubmitPopup(int _finalMarks ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Container(
                    height: 80,
                    child: Center(
                      child: Text(("You got : "+ _finalMarks.toString()+" Marks"), style: TextStyle(color: Colors.red, fontSize: 22,),),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Quiz_Games(),));
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                              "ok",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // get correct marks
  int _globalIndex = 0;
  bool _buttonDisabled = false;
  int _noOfCorrectAnswers = 0;
  List _dbAnswers  = new List.filled(30, Null, growable: false);
  int _finalMarks = 0;

  activateButton(){
    if(_globalIndex== null||_globalIndex== 0){
      _buttonDisabled = false;
    }else _buttonDisabled=true;
  }

  onSubmit(){

  }

  //Timeout popup
  Future<void> openDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Time out.",
                        style: TextStyle(
                          color: Colors.red, fontSize: 22,
                        ),),
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => Quiz_Games(),));
                    },
                    child: Container(
                      width: 125,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColor.btnColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Go to Quizzers",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Timeout popup
  Future<void> openDialogBackConfirm() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Container(
                    height: 80,
                    child: Center(
                      child: Text(
                        "Are you sure",
                        style: TextStyle(
                          color: Colors.red, fontSize: 22,
                        ),),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => Quiz_Games(),));
                      },
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            children: [
              FutureBuilder<List<dynamic>>(
                future: getQuestions(),
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){
                  if(snapshot.hasData){
                    return Expanded(
                      child: ListView.builder(itemCount: snapshot.data?.length ,itemBuilder: (context, index){
                        return Card(
                          elevation: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15,),
                              Text(snapshot.data?[index]["prescription"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 22),),
                              Text(snapshot.data?[index]["postcription"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 22),),

                              SizedBox(height: 10,),

                              RadioListTile(
                                selected: false,
                                value: 1,
                                groupValue: _selectAnswerList[index],
                                onChanged: ( value){
                                  setState(() {
                                    _selectAnswerList[index]= value;
                                    // v1 = value;
                                    // ind1 = index + 1;
                                    _correctAnswerList[index] = value;
                                    print(_correctAnswerList[index]);
                                    print(_correctAnswerList);
                                  });
                                },
                                title: Text(snapshot.data?[index]["ans1"] ?? "",style: TextStyle(fontFamily: 'poppins', fontSize: 20),),
                              ),
                              RadioListTile(
                                selected: false,
                                value: 2,
                                groupValue: _selectAnswerList[index],
                                onChanged: (value){
                                  setState(() {
                                    _selectAnswerList[index]= value;
                                    // v1 = value;
                                    // ind1 = index + 1;
                                    _correctAnswerList[index] = value;
                                    print(_correctAnswerList[index]);
                                    print(_correctAnswerList);
                                  });
                                },
                                title: Text(snapshot.data?[index]["ans2"] ?? "",style: TextStyle(fontFamily: 'poppins', fontSize: 20),),
                              ),
                              RadioListTile(
                                selected: false,
                                value: 3,
                                groupValue: _selectAnswerList[index],
                                onChanged: ( value){
                                  setState(() {
                                    _selectAnswerList[index]= value;
                                    // v1 = value;
                                    // ind1 = index + 1;
                                    _correctAnswerList[index] = value;
                                    print(_correctAnswerList[index]);
                                    print(_correctAnswerList);
                                  });
                                },
                                title: Text(snapshot.data?[index]["ans3"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 20),),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        );
                      }),
                    );
                  } else return Container(
                    child: Center(
                        child: Text("Loading...")
                    ),
                  );

                },
              ),
              Row(
                children: [
                  SizedBox(width: 120,),
                  ElevatedButton(
                      onPressed: _buttonDisabled?(){
                        print(_globalIndex);
                        print(_selectAnswerList[0]);
                        print(_dbAnswers[0]);

                        for(int i=0; i < _globalIndex;i++){
                          if(_selectAnswerList[i]==_dbAnswers[i]){
                            print("_noOfCorrectAnswers");
                            ++_noOfCorrectAnswers;
                          }
                        }
                        _finalMarks=(_noOfCorrectAnswers / _globalIndex*100).round();
                        SubmitPopup(_finalMarks);
                        print(_noOfCorrectAnswers);
                        print(_finalMarks);
                        print("Elevated Button One pressed");
                        _noOfCorrectAnswers=0;
                        _finalMarks =0;
                      }:null,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text('Submit', style: TextStyle(fontFamily: 'poppins', fontSize: 25),),
                      )
                  )
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}