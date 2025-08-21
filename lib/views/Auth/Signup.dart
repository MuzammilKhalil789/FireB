import 'package:firebase/views/Auth/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmController=TextEditingController();
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

      OutlinedButton(
        onPressed: ()  {
       Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginPage()));
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
