import 'package:flutter/material.dart';

class quizzes_admin extends StatefulWidget {
  const quizzes_admin({Key? key}) : super(key: key);

  @override
  State<quizzes_admin> createState() => _quizzes_adminState();
}

class _quizzes_adminState extends State<quizzes_admin> {
  @override

  String dropdownvalue = 'සිංහල';

  var items = [
    'සිංහල',
    'ගණිතය',
    'බුද්ධ ධර්මය',
    'ඉංග්‍රීසි',
    'පරිසරය',
  ];

  String dropdownvalue2 = 'අප අවට සත්තු';
  var items1 = [
    'අප අවට සත්තු',
    'අපේ යහපැවැත්ම',
    'පොලොව හා අහස',
    'අප හා වෙළඳ පොළ',
    'පැලෑටි හා ගස්වැල්',
  ];

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('දිනමු පහ - Edit Quizzes',style: TextStyle(fontFamily: 'Poppins'),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){},
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
                      child: DropdownButton(

                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45),),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 290,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 20),
                      child: DropdownButton(

                        value: dropdownvalue2,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45),),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
                            child: Text("1. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("2. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("3. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("4. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("5. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("6. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("7. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("8. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
                            child: Text("9. පහත පින්තූරයේ...", style: TextStyle(fontSize: 22, fontFamily: "Poppins"),),
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
