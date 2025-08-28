import 'package:firebase/views/firebasefirestore/Insert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage1 extends StatefulWidget {
  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ✅ Fixed regex
  bool _isValidEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6EEF7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🐻 Bear Image
          Expanded(
            flex: 2,
            child: Center(
              child: Image(image: AssetImage('assets/bear.png')),
            ),
          ),

          // 🔐 Login Card with Form
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 📧 Email
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        } else if (!_isValidEmail(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),

                    // 🔑 Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length <=7) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 32),

                    // 🔘 Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: isLoading
                          ? CircularProgressIndicator()
                          :
                      ElevatedButton(
                        onPressed: ()async {

                          isLoading = true;
                          setState(() {});

                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                              .then((onValue) {
                            isLoading = false;
                            setState(() {

                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdmissionFormScreen()));

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Sign up screen successfully"),
                                  backgroundColor: Colors.green,)
                            );

                            setState(() {});
                          }).onError((error,handleError){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please correct email"),
                                  backgroundColor: Colors.red,)
                            );
                            isLoading=false;
                            setState(() {

                            });

                          });
                          if(formKey.currentState!.validate());

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9C27B0),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(color:Colors.white,fontSize:  16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
