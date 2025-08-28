import 'package:firebase/views/firebasefirestore/Fetch.dart';
import 'package:firebase/views/firebasefirestore/Loginui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      ischecked();
    });
  }
  ischecked(){
    if(FirebaseAuth.instance.currentUser==null)
      {
Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage1()));
      }
    else
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Fetch()));
      }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffa66bc2),
      body: Center(
        child: Image.asset('assets/log.webp', width: 200),
      ),
    );
  }
}
