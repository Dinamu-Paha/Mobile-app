import 'dart:convert';

import 'package:dinamu_paha/Component/colors.dart';
import 'package:dinamu_paha/Screens/Admin_home.dart';
import 'package:dinamu_paha/Screens/fogotPass.dart';
import 'package:dinamu_paha/Screens/singUp.dart';
import 'package:dinamu_paha/Screens/subject_UI.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'Add_question.dart';
import 'package:video_player/video_player.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/Video/LoginBK.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String email = "";
  String password = "";

  // final storage = new FlutterSecureStorage();

  bool? check;
  bool? checkRole;


  UserSelect(bool x) {
    if (x == false) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => admin_home(),
          ));
    }
    else if (x == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Subject_UI(),
          ));
    }
  }

  //login request
  Future save() async {
    final res = await http.post(
        Uri.parse('http://ec2-54-215-42-250.us-west-1.compute.amazonaws.com:8080/user/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password})

    );
    // print(jsonDecode(res.body)['email']);
    print(jsonDecode(res.body));

    if (jsonDecode(res.body)['role'] == true) {
      checkRole = true;
    }
    if (jsonDecode(res.body)['role'] == false) {
      checkRole = false;
    }

    if (jsonDecode(res.body)['email'] == "") {
      check = false;
    }
    else {
      check = true;
    }
    LoginValidator(check!);
    // print(check);
    // await storage.write(key:'jwt', value: jsonDecode(res.body)['token']);
    // String? jwt = await storage.read(key: 'jwt');
    // print(jwt);
  }
  //login request end

  //Login function call from sign in
  LoginValidator(bool x) {
    print(check);
    if (x == true) {
      print(checkRole);
      UserSelect(checkRole!);
    }
    else if (x == false) {
      openDialog();
    }
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
                      color: Colors.red, fontSize: 22,
                    ),),
                )),
          ),
        );
      },
    );
  }


//password show
  bool _obscureText = true;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size?.width ?? 0,
                  height: _controller.value.size?.height ?? 0,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
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
                        height: 620,
                        decoration: BoxDecoration(
                            color: AppColor.formBgColor.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 70,
                                child: Center(
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/img_3.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text('Login', style: TextStyle(
                                    fontSize: 48, fontWeight: FontWeight.w900),),
                              ),
                              SizedBox(height: 25,),
                              Container(
                                child: Text(
                                  'Email', style: TextStyle(fontSize: 19),),
                              ),
                              Container(
                                height: 33,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 60,
                                child: TextField(
                                  style: TextStyle(fontSize: 23, fontFamily: 'Poppins'),
                                  controller: TextEditingController(text: email),
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.alternate_email_outlined, size: 20,),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25,),
                              Container(
                                child: Text(
                                  'Password', style: TextStyle(fontSize: 19),),
                              ),
                              Container(
                                height: 33,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 60,
                                child: TextField(
                                  style: TextStyle(fontSize: 23, fontFamily: 'Poppins'),
                                  controller: TextEditingController(text: password),
                                  onChanged: (val) {
                                    password = val;
                                  },
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: _obscureText
                                          ? Icon(
                                        Icons.visibility_off,
                                        color: AppColor.appBColor,
                                      )
                                          : Icon(
                                        Icons.visibility,
                                        color: AppColor.blckColor,
                                      ),
                                      onPressed: () {
                                        setState(() =>
                                        _obscureText = !_obscureText);
                                      },
                                    ),
                                    icon: Icon(Icons.lock_open, size: 20,),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 60,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 23,
                                      child: Checkbox(
                                        value: false,
                                        onChanged: (bool? newValue) {

                                        },
                                      ),
                                    ),
                                    Container(
                                      child: Text('Remember me',
                                        style: TextStyle(fontSize: 15),),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FogotPasswordPage(),
                                            ));
                                      },
                                      child: Container(
                                        child: Text('Forgot Password?',
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.blue),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: () {
                                  // LoginValidator();
                                  // LoginValidator(true);
                                  save();
                                },
                                child: Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width - 60,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.orange,
                                  ),
                                  child: Center(
                                      child: Text('Sign In',
                                        style: TextStyle(fontSize: 20),)),
                                ),
                              ),
                              SizedBox(height: 30,),

                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text('Don\'t have an account?',
                                        style: TextStyle(fontSize: 15),),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SignUpPage(),
                                            ));
                                      },
                                      child: Container(
                                        child: Text(' Register Now',
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.blue),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

