import 'package:firebase/views/Auth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD8D3F5),
      body: Padding(
        padding: const EdgeInsets.all(24),
    child: Center(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    const Text(
    "Signup",
    style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
    ),
    ),
    const SizedBox(height: 30),

      TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: "Email",
          prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
      const SizedBox(height: 20),

      TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: const Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
      const SizedBox(height: 20),

      TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Confirm Password",
          prefixIcon: const Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
      const SizedBox(height: 30),

      ElevatedButton(
        onPressed: () {
          print("Login pressed");
          print("Email: ${emailController.text}");
          print("Password: ${passwordController.text}");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
            vertical: 14,
          ),
        ),
        child: const Text("Login",style: TextStyle(color: Colors.white),),
      ),
      const SizedBox(height: 10),
isLoading?CircularProgressIndicator():
      OutlinedButton(
        onPressed: () async {
          isLoading=true;
          setState(() {

          });
         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
          Get.snackbar(
            'error', // Title of Snackbar
            'Please enter email and password', // Message
            snackPosition: SnackPosition.TOP, // TOP ya BOTTOM
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 3),
            margin: EdgeInsets.all(10),
            borderRadius: 10,
            icon: Icon(Icons.info, color: Colors.white),
            shouldIconPulse: false,
          );
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email:         emailController.text,
              password:      passwordController.text
          ).then((onValue){
         isLoading=false;
         setState(() {

         });


          });
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.deepPurple,
          side: const BorderSide(color: Colors.deepPurple),
          padding: const EdgeInsets.symmetric(
            horizontal: 76,
            vertical: 14,
          ),
        ),
        child: const Text("Sign Up"),
      ),

    ]),
    ),
      ),
    );
  }
}
