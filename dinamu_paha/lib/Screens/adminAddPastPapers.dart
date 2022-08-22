import 'package:dinamu_paha/Screens/admin_pastpapers.dart';
import 'package:flutter/material.dart';

import 'Add_question.dart';
import 'adminAddPastPaperQuestion.dart';

class AdminAddPastPaper extends StatefulWidget {
  const AdminAddPastPaper({Key? key}) : super(key: key);

  @override
  State<AdminAddPastPaper> createState() => _AdminAddPastPaperState();
}

class _AdminAddPastPaperState extends State<AdminAddPastPaper> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - Add PastPaper',style: TextStyle(fontFamily: 'Poppins'),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => AdminPastPapersPage(),
                  ));
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text('Year',style: TextStyle(fontSize: 19),),
                        ),
                        Container(
                          height: 33,
                          width: MediaQuery.of(context).size.width-60,
                          child: TextField(
                            onChanged: (val){

                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.date_range_outlined,size: 20,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                child: Column(
                  children: [

                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Add_PastPaper_Question(),
                ));
            // Add your onPressed code here!
          },
          label: const Text('Add Question', style: TextStyle(fontFamily: 'Poppins', fontSize: 18),),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
