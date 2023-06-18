import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socials/screens/LoadingScreen.dart';
import 'package:socials/screens/home1.dart';
import 'package:socials/services/signinlinkedin.dart';
import 'package:socials/services/signintwitter.dart';
import 'package:socials/utilities/Alerts.dart';
import 'splash.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class signupscreen extends StatefulWidget {
  static const String id = 'signup_screen';

  String useremail = "";
  String userName = "";
  String userphoneid = "";
  late Map<String,dynamic>? LinkedinData={} ;

  signupscreen({super.key});
  _signupscreenState createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isloading = false;
  Future<void> _signInWithGoogle() async {
    try{
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(title: Text('Please Wait'), actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Center(child: CircularProgressIndicator()),
          ),
        ],);
      });

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;

      LinkedinSignIn linkedinSignIn = LinkedinSignIn();


      Map<String , dynamic>? ld =await linkedinSignIn.signInWithLinkedIn();
      setState(() {
        widget.LinkedinData =  ld;
      });

      // TwitterSignIn twitterSignIn = TwitterSignIn() ;
      Navigator.pop(context);
      setState(() {
        widget.LinkedinData = ld;
        isloading = true;
      });

      Navigator.pushReplacementNamed(context, LoadingScreen.id);

    }catch(e){
      print('Error signing in with Google: $e');
      Navigator.pop(context); // Dismiss the "Please wait" alert
      setState(() {
        isloading= false;
      });
    }
  }

  Future<void> validinput() async {

    String input = _textEditingController.text;
    String input1 = _textEditingController1.text;
    String input2 = _textEditingController2.text;
    String input3 = _textEditingController3.text;
    if ( input.length != 10 || input1.isEmpty || input2.isEmpty || input3.isEmpty) {
      showDialog(
        context: _scaffoldKey.currentContext!,
        builder: (BuildContext context) {
          Future.delayed(
            Duration(seconds: 3),
                () {
              if(mounted)
              Navigator.of(context , rootNavigator: true).pop(true);
            },
          );

          return AlertDialog(title: Text('InValid Input'), content: Text('Please fill All the Details and Ensure Mobile Number have 10 Digits'));
        },
      );
    }
    else if (input.length == 10) {
      Navigator.pushReplacementNamed(context, loginscreen.id);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                // Color(0xfffd864e),
                // Color(0xba362257),
                Colors.black45,
                Colors.black87,
                Colors.black45,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Center(
          child: Text('SOCIALS'),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 40),
              child: Center(
                child: Text(
                  'Sign up below to create account , connect with others and start chatting',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    color: Color(0xfffafafa)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text(
                          'Mobile Number : ',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xff6b6868)),
                        ),
                      ),
                      TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.phone,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    color: Color(0xfffafafa)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text(
                          'Name : ',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xff6b6868)),
                        ),
                      ),
                      TextField(
                        controller: _textEditingController1,
                        decoration: InputDecoration(
                            hintText: 'Name',
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    color: Color(0xfffafafa)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: Text(
                          'UserName : ',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xff6b6868)),
                        ),
                      ),
                      TextField(
                        controller: _textEditingController2,
                        decoration: InputDecoration(
                            hintText: 'UserName',
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black38,
                      ),
                      color: Color(0xfffafafa)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(
                            'Password : ',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff6b6868)),
                          ),
                        ),
                        TextField(
                          controller: _textEditingController3,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 55, horizontal: 0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      // Color(0xfffd864e),
                      // Color(0xba362257),
                      Colors.blue,
                      Colors.black87,
                      Colors.blue,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: TextButton(
                  child: Text('SIGN UP',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    setState(() {
                      widget.userphoneid = _textEditingController.text;
                    });
                    validinput();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: 55, horizontal: 0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      // Color(0xfffd864e),
                      // Color(0xba362257),
                      Colors.black45,
                      Colors.black87,
                      Colors.black45,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: TextButton(
                  child: Text('SIGN In With Google',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    _signInWithGoogle();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

