import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socials/screens/profile.dart';
import 'package:socials/services/postOnLinkedin.dart';
import 'screens/home1.dart';
import 'screens/splash.dart';
import 'screens/signUp.dart';
import 'screens/login.dart';
import 'package:url_strategy/url_strategy.dart';
import 'screens/LoadingScreen.dart';
import 'screens/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart' show PlatformException, MethodChannel;
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: 'AIzaSyCHq5NRtQ5cpjcHv52DLeprKvK-QY03GuI', appId: '1:646218024254:android:23ea22719a21e2236cd86f', messagingSenderId: '646218024254', projectId: 'socials-16005')
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  // @override
  // void initState() {
  //   super.initState();
  //   initializeFirebase();
  // }
  //
  // Future<void> initializeFirebase() async {
  //
  //   // options: DefaultFirebaseOptions.currentPlatform;
  //   // Additional initialization or setup code can be placed here
  // }

  @override
  Widget build(BuildContext context) {
    List<Contact>conact=[];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        signupscreen.id: (context) => signupscreen(),
        loginscreen.id: (context) => loginscreen(),
        PostScreen.id: (context) => PostScreen(),

        // homeScreen.id: (context) => homeScreen(contact: conact),

      },
    );
  }
}
