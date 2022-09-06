import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  Function reset;
  String text;

  ResetButton(this.reset, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        reset();
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(30.0),
        ),

        child: Center(child: Text("Reset")),
      ),
    );
  }
}
