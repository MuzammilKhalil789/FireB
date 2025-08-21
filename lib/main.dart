import 'package:firebase/firebase_options.dart';
import 'package:firebase/views/Auth/Login.dart';
import 'package:firebase/views/Auth/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



import 'firebase_options.dart';
void main()async
{

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //Signup(),
      LoginPage(),
      //LoginScreen(),
    );
  }
}
