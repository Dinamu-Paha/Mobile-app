import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../Component/colors.dart';
import 'Quizzes_&_Games.dart';
import 'package:http/http.dart' as http;


class QuizeInside extends StatefulWidget {
  const QuizeInside({Key? key}) : super(key: key);

  @override
  State<QuizeInside> createState() => _QuizeInsideState();
}

class _QuizeInsideState extends State<QuizeInside> {
  String _quizeName = 'sampleQuize';

  late Timer _timer;
  int _start = 1000;


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

 int length=0;

  Future <List<dynamic>> getQuestions()async {


    final res = await http.get(
        Uri.parse('http://192.168.43.90:8080/question/getquestion/36/37')
        // headers: {'Content-Type': 'application/json'}
    );
    List<dynamic> responsejson = json.decode(utf8.decode(res.bodyBytes));
    print(responsejson);

    return responsejson;
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

  int a = 3;
  int b = 2;
  List tList = [];

  void printls() {
    tList = List.generate(a, (i) => List.filled(b, null, growable: false));
    print(tList);
  }

  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      startTimer();
      // getQuestions() ;
      printls();
    });
  }
  bool? value=false;
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
          child: FutureBuilder<List<dynamic>>(
            future: getQuestions(),
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){
              if(snapshot.hasData){
                return ListView.builder(itemCount: snapshot.data?.length ,itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data?[index]["prescription"] ?? ""),
                        Text(snapshot.data?[index]["postcription"] ?? ""),

                        SizedBox(height: 20,),


                        Row(
                          children: [
                            Checkbox(
                              value: value,
                              onChanged: (bool? newValue) {
                                tList[0][1] = newValue;
                              },
                            ),
                            Text(snapshot.data?[index]["ans1"] ?? ""),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: value,
                              onChanged: (bool? newValue) {
                                tList[0][1] = newValue;
                              },
                            ),
                            Text(snapshot.data?[index]["ans2"] ?? ""),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: value,
                              onChanged: (bool? newValue) {
                                tList[0][1] = newValue;
                              },
                            ),
                            Text(snapshot.data?[index]["ans3"] ?? ""),
                          ],
                        ),
                        SizedBox(height: 20,),


                      ],
                    ),
                  );
                });

                // child: ListTile(
                //   tileColor: Colors.red,
                //   title: Text(snapshot.data?[index]["prescription"] ?? "got null"),
                // ),

              } else return Container(
                  child: Center(
                      child: Text("Loading...")
                  ),
                );

            },
          ),
        ),
      ),
    );
  }
}
