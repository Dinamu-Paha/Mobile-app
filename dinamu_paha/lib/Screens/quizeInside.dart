import 'dart:async';

import 'package:flutter/material.dart';

import '../Component/colors.dart';
import 'Quizzes_&_Games.dart';

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

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      startTimer();
      print("Build Completed");
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
        color: Colors.red,
      ),
    );
  }
}