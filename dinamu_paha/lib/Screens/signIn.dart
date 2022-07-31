import 'package:dinamu_paha/Screens/singUp.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Login',style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Email',style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.alternate_email_outlined,size: 20,),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Text('Password',style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                      height: 33,
                      width: MediaQuery.of(context).size.width-60,
                      child: TextField(
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
                          Container(
                            child: Text('Forgot Password?',style: TextStyle(fontSize: 15),),
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
                          child: Text('Sign In',style: TextStyle(fontSize: 15),)),
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
                          Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
