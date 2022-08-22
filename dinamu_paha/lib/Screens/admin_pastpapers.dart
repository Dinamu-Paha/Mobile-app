import 'package:flutter/material.dart';

import 'Add_question.dart';
import 'Admin_home.dart';
import 'adminAddPastPapers.dart';

class AdminPastPapersPage extends StatefulWidget {
  const AdminPastPapersPage({Key? key}) : super(key: key);

  @override
  State<AdminPastPapersPage> createState() => _AdminPastPapersPageState();
}

class _AdminPastPapersPageState extends State<AdminPastPapersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - PastPapers',style: TextStyle(fontFamily: 'Poppins'),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => admin_home(),
                  ));
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2005", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2006", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2007", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2008", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2009", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2010", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2011", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2012", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-140,
                            height: 29,
                            child: Text("2013", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
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
                  builder: (BuildContext context) => AdminAddPastPaper(),
                ));
            // Add your onPressed code here!
          },
          label: const Text('Add PastPaper', style: TextStyle(fontFamily: 'Poppins', fontSize: 18),),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
