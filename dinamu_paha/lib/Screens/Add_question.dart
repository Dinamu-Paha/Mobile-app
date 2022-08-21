import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Add_Question extends StatefulWidget {
  const Add_Question({Key? key}) : super(key: key);

  @override
  State<Add_Question> createState() => _Add_QuestionState();
}

class _Add_QuestionState extends State<Add_Question> {

  Future addQuestion() async{
    final storage = new FlutterSecureStorage();
    print(storage.read(jwt: jwt));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('දිනමු පහ - Add Question',style: TextStyle(fontFamily: 'Poppins'),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){},
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Prescription',
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    minLines: 1,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        width: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.upload)),
                              Text('Upload Image',style: TextStyle(fontFamily: 'Poppins', color: Colors.lightBlue, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        width: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.upload)),
                              Text('Upload Image',style: TextStyle(fontFamily: 'Poppins', color: Colors.lightBlue, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        height: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        width: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.upload)),
                              Text('Upload Image',style: TextStyle(fontFamily: 'Poppins', color: Colors.lightBlue, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        width: MediaQuery.of(context).size.width-(40+(MediaQuery.of(context).size.width)/2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.upload)),
                              Text('Upload Image',style: TextStyle(fontFamily: 'Poppins', color: Colors.lightBlue, fontSize: 15),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Postcription',
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    minLines: 1,
                    maxLines: 5,
                  ),
                  SizedBox(height: 30,),
                  Text('Answers', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 22, fontStyle: FontStyle.italic),),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '1. Answer',
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    minLines: 1,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '2. Answer',
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    minLines: 1,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '3. Answer',
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    minLines: 1,
                    maxLines: 5,
                  ),
                  SizedBox(height: 30,),
                  Text('Correct Answer', style: TextStyle(color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 22, fontStyle: FontStyle.italic),),
                  SizedBox(height: 20,),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Number of CORRECT ANSWER',
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                  ),
                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: (){
                      addQuestion();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width-60,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Center(
                          child: Text('Add Question', style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 25, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),
          ),
    ),
    );
  }
}
