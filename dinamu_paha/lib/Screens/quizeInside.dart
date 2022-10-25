import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../Component/colors.dart';
import 'Quizzes_&_Games.dart';
import 'package:http/http.dart' as http;


class QuizeInside extends StatefulWidget {
  var quizName;
   QuizeInside({Key? key, this.quizName}) : super(key: key);

  @override
  State<QuizeInside> createState() => _QuizeInsideState();
}

class _QuizeInsideState extends State<QuizeInside> {
  String _quizeName = '';

  //for timer
  late Timer _timer;
  int _start = 3000;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          openDialog();
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  // get questions
  List _correctAnswerList  = new List.filled(30, null, growable: false);
  List _selectAnswerList  = new List.filled(30, 5, growable: false);

  Future <List<dynamic>> getQuestions()async {
    final res = await http.get(
        Uri.parse('http://192.168.1.102:8080/question/getquestionsofquiz/'+widget.quizName.toString())
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

  //submit popup
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

  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      startTimer();
      _quizeName= widget.quizName;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            child: Icon(Icons.arrow_back),
                onTap: (){
                  openDialogBackConfirm();
                },
        ),
        title: Text(_quizeName, style: TextStyle(fontFamily: "poppins"),),
        actions: [
          Container(
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(((_start/60).floor().toString()+ " : " + (_start%60).toString()),style: TextStyle(
                  fontSize: 30
                ),),
              ],
            ),
          ),
        ],
      ),
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
                              Text("0"+ (index+1).toString() +") "+snapshot.data?[index]["prescription"] ?? "", style: TextStyle(fontFamily: 'poppins', fontSize: 22),),
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

