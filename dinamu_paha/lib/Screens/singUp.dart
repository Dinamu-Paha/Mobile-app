import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('Sign up',style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900,color: Colors.white,),),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: Text('Full name',style: TextStyle(fontSize: 15,color: Colors.white,),),
                      ),
                      Container(
                        height: 33,
                        width: MediaQuery.of(context).size.width-60,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ) ,
                            icon: Icon(Icons.person_rounded ,size: 20,color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: Text('Email',style: TextStyle(fontSize: 15,color: Colors.white,),),
                      ),
                      Container(
                        height: 33,
                        width: MediaQuery.of(context).size.width-60,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ) ,
                            icon: Icon(Icons.alternate_email_outlined,size: 20,color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: Text('Password',style: TextStyle(fontSize: 15,color: Colors.white,),),
                      ),
                      Container(
                        height: 33,
                        width: MediaQuery.of(context).size.width-60,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                            ) ,
                            icon: Icon(Icons.lock_open,size: 20,color: Colors.white,),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width-60,
                        child: Column(
                          children: [
                            Container(
                              child: Text('By signing up, you agree to our',style: TextStyle(fontSize: 15,color: Colors.white,),),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text('Terms & Conditions ',style: TextStyle(fontSize: 15,color: Colors.blue,),),
                                  ),
                                  Container(
                                    child: Text('and',style: TextStyle(fontSize: 15,color: Colors.white,),),
                                  ),
                                  Container(
                                    child: Text(' Privacy Policy',style: TextStyle(fontSize: 15,color: Colors.blue,),),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width-60,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Center(
                            child: Text('Sign Up',style: TextStyle(fontSize: 15,color: Colors.white,),)),
                      ),

                    ],
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
