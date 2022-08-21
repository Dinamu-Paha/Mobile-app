import 'package:dinamu_paha/Screens/studentProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectStats extends StatefulWidget {
  var title;
   SubjectStats({Key? key, this.title }) : super(key: key);

  @override
  State<SubjectStats> createState() => _SubjectStatsState();
}

class _SubjectStatsState extends State<SubjectStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title} Statics"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => StudentProfile(),
                ));
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,

              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width-50,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("Progress of ${widget.title}",style: TextStyle(fontSize: 20),)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("5/12",style: TextStyle(fontSize: 60),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("You have finished",style: TextStyle(fontSize: 20),)
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
