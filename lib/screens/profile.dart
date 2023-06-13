import 'package:flutter/material.dart';
// import 'package:socials/screens/signUp.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: CircleAvatar(
                    radius: 40,
                  ),
                ),
                Text("signupscreen."),
              ],
            ),
          )
        ],
      ),
    );
  }
}
