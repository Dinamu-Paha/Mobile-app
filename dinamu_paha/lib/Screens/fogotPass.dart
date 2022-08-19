import 'package:dinamu_paha/Screens/signIn.dart';
import 'package:flutter/material.dart';

import '../Component/colors.dart';

class FogotPasswordPage extends StatefulWidget {
  const FogotPasswordPage({Key? key}) : super(key: key);

  @override
  State<FogotPasswordPage> createState() => _FogotPasswordPageState();
}

class _FogotPasswordPageState extends State<FogotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img.png"),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            child: Text('Fogot Password',style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            child: Text('Email',style: TextStyle(fontSize: 19),),
                          ),
                          Container(
                            height: 33,
                            width: MediaQuery.of(context).size.width-60,
                            child: TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.email_outlined,size: 20,),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => SignInPage(),
                                  ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width-60,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.btnColor,
                              ),
                              child: Center(
                                  child: Text('Send Password Reset code',style: TextStyle(fontSize: 20),)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text('Back to ',style: TextStyle(fontSize: 15),),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => SignInPage(),
                                        ));
                                  },
                                  child: Container(
                                    child: Text(' Login',style: TextStyle(fontSize: 15, color: Colors.blue),),
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
