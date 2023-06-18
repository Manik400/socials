// // import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:contacts_service/contacts_service.dart';
//
// class homeScreen extends StatefulWidget {
//   static const String id = 'home_screen';
//   const homeScreen({super.key});
//   _homeScreenState createState() => _homeScreenState();
// }
//
// class _homeScreenState extends State<homeScreen> {
//   ScrollController _scrollController = ScrollController();
//
//   List<Contact> contacts = [];
//
//   @override
//   Future<PermissionStatus> _getContacts() async {
//     PermissionStatus status = await Permission.contacts.request();
//
//     if (status.isGranted) {
//       Iterable<Contact> contactlist = await ContactsService.getContacts();
//       // contacts = contactlist.toList();
//     }
//     return status;
//   }
//
//   void getpermison() async {
//     var status = await Permission.contacts.status;
//     if (status.isDenied) {
//       Permission.contacts.request();
//     }
//   }
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // fetchContact();
//     // getpermison();
//     _getContacts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<PermissionStatus>(
//       future: _getContacts(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Permission request is in progress
//           return Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(100),
//               child: AppBar(
// // toolbarHeight: 70,
//                 flexibleSpace: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: <Color>[
//                         Color(0xfffd864e),
//                         Color(0xba362257),
//                       ],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
//                         child: Text(
//                           '',
//                           style: TextStyle(color: Colors.white, fontSize: 25),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Chats',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Status',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Calls',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 title: Text('SOCIALS'),
//                 actions: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.photo_camera,
//                         color: Colors.white,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             opaque: false,
//                             pageBuilder: (BuildContext context, _, __) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Scaffold(
//                                   backgroundColor: Colors.transparent,
//                                   body: Container(
//                                     decoration: BoxDecoration(
//                                       gradient: LinearGradient(
//                                         colors: <Color>[
//                                           Color(0xfffd864e),
//                                           Color(0xba362257),
//                                         ],
//                                         begin: Alignment.centerLeft,
//                                         end: Alignment.centerRight,
//                                       ),
//                                     ),
// // color: Colors.white,
//                                     height: 50,
//                                     child: TextField(
//                                       style: TextStyle(color: Colors.white),
//                                       autofocus: true,
//                                       decoration: InputDecoration(
// // fillColor: Colors.white,
// // color
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.zero,
//                                               borderSide: BorderSide(
//                                                   color: Colors.white12)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.zero,
//                                               borderSide: BorderSide(
//                                                   color: Colors.white))),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       )),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: PopupMenuButton<String>(
//                       itemBuilder: (BuildContext context) {
//                         return [
//                           PopupMenuItem(child: Text('Profile')),
//                           PopupMenuItem(child: Text('Setting')),
//                         ];
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: Center(
//               child: CircularProgressIndicator(
//                   backgroundColor: Colors.grey.shade300),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           if (snapshot.data == PermissionStatus.granted) {
//             return Scaffold(
//               appBar: PreferredSize(
//                 preferredSize: Size.fromHeight(100),
//                 child: AppBar(
// // toolbarHeight: 70,
//                   flexibleSpace: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: <Color>[
//                           Color(0xfffd864e),
//                           Color(0xba362257),
//                         ],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
//                           child: Text(
//                             '',
//                             style: TextStyle(color: Colors.white, fontSize: 25),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Chats',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Status',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Calls',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   title: Text('SOCIALS'),
//                   actions: [
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.photo_camera,
//                           color: Colors.white,
//                         )),
//                     IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             PageRouteBuilder(
//                               opaque: false,
//                               pageBuilder: (BuildContext context, _, __) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Scaffold(
//                                     backgroundColor: Colors.transparent,
//                                     body: Container(
//                                       decoration: BoxDecoration(
//                                         gradient: LinearGradient(
//                                           colors: <Color>[
//                                             Color(0xfffd864e),
//                                             Color(0xba362257),
//                                           ],
//                                           begin: Alignment.centerLeft,
//                                           end: Alignment.centerRight,
//                                         ),
//                                       ),
// // color: Colors.white,
//                                       height: 50,
//                                       child: TextField(
//                                         style: TextStyle(color: Colors.white),
//                                         autofocus: true,
//                                         decoration: InputDecoration(
// // fillColor: Colors.white,
// // color
//                                             enabledBorder: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.zero,
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white12)),
//                                             focusedBorder: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.zero,
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white))),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         icon: Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         )),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: PopupMenuButton<String>(
//                         itemBuilder: (BuildContext context) {
//                           return [
//                             PopupMenuItem(child: Text('Profile')),
//                             PopupMenuItem(child: Text('Setting')),
//                           ];
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               body: ListView.builder(
// // controller: _scrollController,
//                 itemCount: contacts.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Contact contact = contacts[index];
//                   return ListTile(
//                     tileColor: Colors.white,
//                     leading: Padding(
//                       padding: const EdgeInsets.only(left: 9.0),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.black45,
//                         radius: 20,
// // foregroundImage: contact.avatar.first,
//                       ),
//                     ),
//                     title: Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 1.800000000, 0, 0),
//                       child: Text(
//                           contact.displayName ??
//                               contact.phones!.first.value.toString(),
//                           style: TextStyle(fontSize: 18)),
//                     ),
//                     subtitle: Text(
//                       'Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem',
//                       maxLines: 1,
//                       style: TextStyle(fontSize: 12.0),
//                     ),
//                     contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
//                     isThreeLine: true,
//                     onTap: () {},
//                     dense: true,
//                   );
//                 },
//               ),
//             );
//           } else {
//             return Scaffold(
//               appBar: PreferredSize(
//                 preferredSize: Size.fromHeight(100),
//                 child: AppBar(
// // toolbarHeight: 70,
//                   flexibleSpace: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: <Color>[
//                           Color(0xfffd864e),
//                           Color(0xba362257),
//                         ],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
//                           child: Text(
//                             '',
//                             style: TextStyle(color: Colors.white, fontSize: 25),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Chats',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Status',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Calls',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   title: Text('SOCIALS'),
//                   actions: [
//                     IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.photo_camera,
//                           color: Colors.white,
//                         )),
//                     IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             PageRouteBuilder(
//                               opaque: false,
//                               pageBuilder: (BuildContext context, _, __) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: Scaffold(
//                                     backgroundColor: Colors.transparent,
//                                     body: Container(
//                                       decoration: BoxDecoration(
//                                         gradient: LinearGradient(
//                                           colors: <Color>[
//                                             Color(0xfffd864e),
//                                             Color(0xba362257),
//                                           ],
//                                           begin: Alignment.centerLeft,
//                                           end: Alignment.centerRight,
//                                         ),
//                                       ),
// // color: Colors.white,
//                                       height: 50,
//                                       child: TextField(
//                                         style: TextStyle(color: Colors.white),
//                                         autofocus: true,
//                                         decoration: InputDecoration(
// // fillColor: Colors.white,
// // color
//                                             enabledBorder: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.zero,
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white12)),
//                                             focusedBorder: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.zero,
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white))),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         icon: Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         )),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: PopupMenuButton<String>(
//                         itemBuilder: (BuildContext context) {
//                           return [
//                             PopupMenuItem(child: Text('Profile')),
//                             PopupMenuItem(child: Text('Setting')),
//                           ];
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               backgroundColor: Colors.grey.shade400,
//               body: Center(
//                 child: Text(
//                   'Permission Denied',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                   ),
//                 ),
//               ),
//             );
//           }
//         } else if (snapshot.hasError) {
//           // Error occurred during permission request
//           return Scaffold(
//             body: Center(
//               child: Text('Error occurred: ${snapshot.error}'),
//             ),
//           );
//         } else {
//           return Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(100),
//               child: AppBar(
// // toolbarHeight: 70,
//                 flexibleSpace: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: <Color>[
//                         Color(0xfffd864e),
//                         Color(0xba362257),
//                       ],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
//                         child: Text(
//                           '',
//                           style: TextStyle(color: Colors.white, fontSize: 25),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Chats',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Status',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Calls',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 title: Text('SOCIALS'),
//                 actions: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.photo_camera,
//                         color: Colors.white,
//                       )),
//                   IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             opaque: false,
//                             pageBuilder: (BuildContext context, _, __) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Scaffold(
//                                   backgroundColor: Colors.transparent,
//                                   body: Container(
//                                     decoration: BoxDecoration(
//                                       gradient: LinearGradient(
//                                         colors: <Color>[
//                                           Color(0xfffd864e),
//                                           Color(0xba362257),
//                                         ],
//                                         begin: Alignment.centerLeft,
//                                         end: Alignment.centerRight,
//                                       ),
//                                     ),
// // color: Colors.white,
//                                     height: 50,
//                                     child: TextField(
//                                       style: TextStyle(color: Colors.white),
//                                       autofocus: true,
//                                       decoration: InputDecoration(
// // fillColor: Colors.white,
// // color
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.zero,
//                                               borderSide: BorderSide(
//                                                   color: Colors.white12)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.zero,
//                                               borderSide: BorderSide(
//                                                   color: Colors.white))),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       )),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: PopupMenuButton<String>(
//                       itemBuilder: (BuildContext context) {
//                         return [
//                           PopupMenuItem(child: Text('Profile')),
//                           PopupMenuItem(child: Text('Setting')),
//                         ];
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             backgroundColor: Colors.grey.shade400,
//             body: Center(
//               child: Text(
//                 'Permission Denied',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
//
//
//
// //
// // ListView.builder(
// // // controller: _scrollController,
// // itemCount: contacts.length,
// // itemBuilder: (BuildContext context, int index) {
// // Contact contact = contacts[index];
// // return ListTile(
// // tileColor: Colors.white,
// // leading: Padding(
// // padding: const EdgeInsets.only(left: 9.0),
// // child: CircleAvatar(
// // backgroundColor: Colors.black45,
// // radius: 20,
// // // foregroundImage: contact.avatar.first,
// // ),
// // ),
// // title: Padding(
// // padding: const EdgeInsets.fromLTRB(0, 1.800000000, 0, 0),
// // child: Text(
// // contact.displayName ?? contact.phones!.first.value.toString(),
// // style: TextStyle(fontSize: 18)),
// // ),
// // subtitle: Text(
// // 'Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem',
// // maxLines: 1,
// // style: TextStyle(fontSize: 12.0),
// // ),
// // contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
// // isThreeLine: true,
// // onTap: () {},
// // dense: true,
// // );
// // },
// // ),
//
//
//
//
//
// // PreferredSize(
// // preferredSize: Size.fromHeight(100),
// // child: AppBar(
// // // toolbarHeight: 70,
// // flexibleSpace: Container(
// // decoration: BoxDecoration(
// // gradient: LinearGradient(
// // colors: <Color>[
// // Color(0xfffd864e),
// // Color(0xba362257),
// // ],
// // begin: Alignment.centerLeft,
// // end: Alignment.centerRight,
// // ),
// // ),
// // child: Column(
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Padding(
// // padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
// // child: Text(
// // '',
// // style: TextStyle(color: Colors.white, fontSize: 25),
// // ),
// // ),
// // Padding(
// // padding: const EdgeInsets.only(bottom: 8.0),
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // children: [
// // TextButton(
// // onPressed: () {},
// // child: Text(
// // 'Chats',
// // style: TextStyle(color: Colors.white, fontSize: 20),
// // )),
// // TextButton(
// // onPressed: () {},
// // child: Text(
// // 'Status',
// // style: TextStyle(color: Colors.white, fontSize: 20),
// // )),
// // TextButton(
// // onPressed: () {},
// // child: Text(
// // 'Calls',
// // style: TextStyle(color: Colors.white, fontSize: 20),
// // )),
// // ],
// // ),
// // ),
// // ],
// // ),
// // ),
// // title: Text('SOCIALS'),
// // actions: [
// // IconButton(
// // onPressed: () {},
// // icon: Icon(
// // Icons.photo_camera,
// // color: Colors.white,
// // )),
// // IconButton(
// // onPressed: () {
// // Navigator.push(
// // context,
// // PageRouteBuilder(
// // opaque: false,
// // pageBuilder: (BuildContext context, _, __) {
// // return GestureDetector(
// // onTap: () {
// // Navigator.pop(context);
// // },
// // child: Scaffold(
// // backgroundColor: Colors.transparent,
// // body: Container(
// // decoration: BoxDecoration(
// // gradient: LinearGradient(
// // colors: <Color>[
// // Color(0xfffd864e),
// // Color(0xba362257),
// // ],
// // begin: Alignment.centerLeft,
// // end: Alignment.centerRight,
// // ),
// // ),
// // // color: Colors.white,
// // height: 50,
// // child: TextField(
// // style: TextStyle(color: Colors.white),
// // autofocus: true,
// // decoration: InputDecoration(
// // // fillColor: Colors.white,
// // // color
// // enabledBorder: OutlineInputBorder(
// // borderRadius: BorderRadius.zero,
// // borderSide:
// // BorderSide(color: Colors.white12)),
// // focusedBorder: OutlineInputBorder(
// // borderRadius: BorderRadius.zero,
// // borderSide:
// // BorderSide(color: Colors.white))),
// // ),
// // ),
// // ),
// // );
// // },
// // ),
// // );
// // },
// // icon: Icon(
// // Icons.search,
// // color: Colors.white,
// // )),
// // GestureDetector(
// // onTap: () {
// // Navigator.pop(context);
// // },
// // child: PopupMenuButton<String>(
// // itemBuilder: (BuildContext context) {
// // return [
// // PopupMenuItem(child: Text('Profile')),
// // PopupMenuItem(child: Text('Setting')),
// // ];
// // },
// // ),
// // ),
// // ],
// // ),
// // ),

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:socials/screens/home1.dart';
import 'package:socials/services/getContacts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcontactdata();
  }

   Future<void> getcontactdata() async {
    ContactP contactP = ContactP();
    await contactP.getPermissoin();
    List<Contact> contact1 = await contactP.contacts;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return homeScreen(contact: contact1);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
