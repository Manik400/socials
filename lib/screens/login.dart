import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socials/screens/LoadingScreen.dart';
import 'package:socials/screens/post.dart';

class loginscreen extends StatefulWidget {
  static const String id = 'login_screen';
  const loginscreen({super.key});
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController _textEditingController = TextEditingController();

  void validinput() {
    String input = _textEditingController.text;
    if (input.length != 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(
            Duration(seconds: 1),
                () {
              Navigator.of(context).pop(true);
            },
          );

          return AlertDialog(
            title: Text('Invalid Phone Number'),
            content: Text('Enter 10 Digit Phone Number'),
          );
        },
      );
    } else {
      Navigator.pushReplacementNamed(context, LoadingScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Login below to connect with others and start chatting',
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
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
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
                      Colors.black45,
                      Colors.black87,
                      Colors.black45,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: TextButton(
                  child: Text('LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    validinput();
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
