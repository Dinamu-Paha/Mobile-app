import 'dart:convert';

import 'package:dinamu_paha/Component/colors.dart';
import 'package:dinamu_paha/Screens/fogotPass.dart';
import 'package:dinamu_paha/Screens/singUp.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'Add_question.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String email = "";
  String password = "";
  // final storage = new FlutterSecureStorage();


  Future save() async{
    final res = await http.post( Uri.parse('http://192.168.56.1:8080/user/login'),
    headers:{'Content-Type':'application/json'},
    body:json.encode({'email':email, 'password':password})

    );
    print(jsonDecode(res.body)['token']);
    // await storage.write(key:'jwt', value: jsonDecode(res.body)['token']);
    // String? jwt = await storage.read(key: 'jwt');
    // print(jwt);
  }

  //Login function call from sign in
  LoginValidator(bool x){
    setState(() {
      if(x==true){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Subject_UI(),
            ));
      }
      else if(x==false){
        openDialog();
      }
    });
  }

  //Error popup
  Future<void> openDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.red.shade50,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(

            child: Container(
              height: 100,
                child: Center(
                  child: Text(
                    "Incorrect Email or Password.",
                    style: TextStyle(
                        color: Colors.red,fontSize: 22,
                    ),),
                )),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_9.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.blue.withOpacity(0.25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 680,
                    decoration: BoxDecoration(
                      color: AppColor.formBgColor.withOpacity(0.75),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100),bottomRight: Radius.circular(100),)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-70,
                            child: Center(
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/img_5.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text('Login',style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            child: Text('Email',style: TextStyle(fontSize: 19),),
                          ),
                          Container(
                            height: 33,
                            width: MediaQuery.of(context).size.width-60,
                            child: TextField(
                              controller: TextEditingController(text: email),
                              onChanged: (val){
                                email = val;
                              },
                              decoration: InputDecoration(
                                icon: Icon(Icons.alternate_email_outlined,size: 20,),
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            child: Text('Password',style: TextStyle(fontSize: 19),),
                          ),
                          Container(
                            height: 33,
                            width: MediaQuery.of(context).size.width-60,
                            child: TextField(
                              controller: TextEditingController(text:password),
                              onChanged: (val){
                                password = val;
                              },
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock_open,size: 20,),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Row(
                              children: [
                                Container(
                                  height:15,
                                width: 23,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (bool? newValue){

                                  },
                                ),
                              ),
                                Container(
                                  child: Text('Remember me',style: TextStyle(fontSize: 15),),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => FogotPasswordPage(),
                                        ));
                                  },
                                  child: Container(
                                    child: Text('Forgot Password?',style: TextStyle(fontSize: 15,color: Colors.blue),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              LoginValidator(true);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width-60,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                              child: Center(
                                  child: Text('Sign In',style: TextStyle(fontSize: 20),)),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Or Sign in with',style: TextStyle(fontSize: 15),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width-60,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    openDialog();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(width: 2.0, color: const Color(0xFF000000)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/img_4.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Container(
                                          child: Text('Google',style: TextStyle(fontSize: 15),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Don\'t have an account?',style: TextStyle(fontSize: 15),),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => SignUpPage(),
                                        ));
                                  },
                                  child: Container(
                                    child: Text(' Register Now',style: TextStyle(fontSize: 15, color: Colors.blue),),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
