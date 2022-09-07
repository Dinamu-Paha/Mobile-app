import 'dart:async';
import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:flutter/material.dart';
import '../Screens/Sub_topic_UI.dart';
import 'widgets/Menu.dart';
import 'widgets/MyTitle.dart';
import 'widgets/Grid.dart';

class SlidingGame extends StatefulWidget {
  @override
  _SlidingGameState createState() => _SlidingGameState();
}

class _SlidingGameState extends State<SlidingGame> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8 ];
  int move = 0;

  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer?  _timer;

  @override
   void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (_timer == null) {
      _timer = new Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: MyTitle(size),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInPage(),
                ));
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Grid(numbers, size, clickGrid),
              Menu(reset, move, secondsPassed, size),
            ],
          ),
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 3 != 0 ||
        index + 1 < 9 && numbers[index + 1] == 0 && (index + 1) % 3 != 0 ||
        (index - 3 >= 0 && numbers[index - 3] == 0) ||
        (index + 3 < 9 && numbers[index + 3] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    checkWin();
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You Won!!",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 220.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: GestureDetector(
                            onTap: (){
                              reset();
                            },
                            child: Container(
                              child: Text(
                                "Restart",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
