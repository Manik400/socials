import 'package:flutter/material.dart';
import 'package:socials/screens/signUp.dart';
// import 'package:socials/utilities/buttons.dart';


class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Color(0xffcfd9de),
                        height: MediaQuery.of(context).size.height * 0.26,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 9.0, 18.0, 0),
                        child: TextButton(onPressed: (){
                          Navigator.pushNamed(context, signupscreen.id);
                        }, child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15.0)
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.black54)
                                  )
                              )
                          ),),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: CircleAvatar(
                          radius: 70,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(21, 10, 0, 2),
                        child: Text("signupscreen." ,style: TextStyle(
                            fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.none
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(21, 2, 0, 0),
                        child: Text("@sinfsnif" , style: TextStyle(
                            fontSize: 16, color: Color(0xff7e898e),fontWeight: FontWeight.w700,decoration: TextDecoration.none
                        ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // Divider(
                      //   height: 10.0,
                      //   thickness: 1.0,
                      //   color: Colors.grey, // Changed color to grey
                      // ),
                      // Text('data')
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.55, // Adjust position as needed
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text('data' , style: TextStyle(
                          color: Colors.black , decoration: TextDecoration.none, fontSize: 25.0
                      ),),
                      Divider(
                        height: 10.0,
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
// controller: _scrollController,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            // Contact contact = widget.contact[index];
                            return ListTile(
                              tileColor: Colors.white,
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 9.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black45,
                                  radius: 20,
// foregroundImage: contact.avatar.first,
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 1.800000000, 0, 0),
                                child: Text(
                                  'Title',
                                    style: TextStyle(fontSize: 18)),
                              ),
                              subtitle: Text(
                                'Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem',
                                maxLines: 1,
                                style: TextStyle(fontSize: 12.0),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                              isThreeLine: true,
                              onTap: () {},
                              dense: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
