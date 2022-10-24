import 'package:dinamu_paha/Component/colors.dart';
import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  const Game1({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var tiles = List.filled(9, 0);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height-400,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  for (var i = 0; i < 9; i++)
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(5.0, 5.0), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(7),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tiles[i] = 1;
                            runAi();
                          });
                        },
                        child: Center(
                            child: Text(tiles[i] == 0
                                ? ''
                                : tiles[i] == 1
                                ? 'X'
                                : 'O',style: TextStyle(fontSize: 30),),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 50,),
                Text(isWinning(1, tiles)
                    ? 'You won!'
                    : isWinning(2, tiles)
                    ? 'You lost!'
                    : 'Your move', style: TextStyle(fontSize: 25, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                SizedBox(height: 30,),
                OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                      elevation: ButtonStyleButton.allOrNull(0.0),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(40, 20, 40, 20)),
                  ),
                    onPressed: () {
                      setState(() {
                        tiles = List.filled(9, 0);
                      });
                    },
                    child: Text('Restart', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40, fontFamily: 'poppins', fontStyle: FontStyle.italic),))
              ],
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void runAi() async {
    await Future.delayed(Duration(milliseconds: 200));

    int? winning;
    int? blocking;
    int? normal;

    for (var i = 0; i < 9; i++) {
      var val = tiles[i];

      if (val > 0) {
        continue;
      }

      var future = [...tiles]..[i] = 2;

      if (isWinning(2, future)) {
        winning = i;
      }

      future[i] = 1;

      if (isWinning(1, future)) {
        blocking = i;
      }

      normal = i;
    }

    var move = winning ?? blocking ?? normal;

    if (move != null) {
      setState(() {
        tiles[move] = 2;
      });
    }
  }

  bool isWinning(int who, List<int> tiles) {
    return (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);
  }
}
