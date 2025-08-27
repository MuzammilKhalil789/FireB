import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/views/firebasefirestore/Fetch.dart';
import 'package:flutter/material.dart';

class AdmissionFormScreen extends StatefulWidget {
  @override
  _AdmissionFormScreenState createState() => _AdmissionFormScreenState();
}

class _AdmissionFormScreenState extends State<AdmissionFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final fnameController=TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController=TextEditingController();
  final dobController=TextEditingController();
  final addressController = TextEditingController();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade200, Colors.purple.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                    Text('Admission Form',style: TextStyle(color: Color(0xFF9C27B0),fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 50,),
                  // Full Name
                  TextFormField(
                    controller: nameController,
                    decoration: _buildDecoration("Full Name"),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: fnameController,
                    decoration: _buildDecoration("Father Name"),
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your FatherName' : null,
                  ),
                  SizedBox(height: 16,),
                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: _buildDecoration("Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter your email';
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) return 'Enter valid email';
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Phone Number
                  TextFormField(
                    controller: phoneController,
                    decoration: _buildDecoration("Phone Number"),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter phone number';
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) return '10-digit number only';
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: genderController,
                    decoration: _buildDecoration("Gender"),
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Please select your gender' : null,

                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: dobController,
                    decoration: _buildDecoration(" Date of Birth"),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Please select your date of birth' : null,

                  ),
                  SizedBox(height: 16,),
                  // Address
                  TextFormField(
                    controller: addressController,
                    decoration: _buildDecoration("Address"),
                    maxLines: 3,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your address' : null,
                  ),
                  SizedBox(height: 30),

                  //
                  // Submit Button
                  isLoading
                      ? CircularProgressIndicator()
                      :
                  TextButton(
                    onPressed: () async{
                      String id=DateTime.now().microsecond.toString();
                      isLoading=true;
                      setState(() {

                      });
                      await FirebaseFirestore.instance.collection('student data').doc(
                        id
                      ).set({
                        'name':nameController.text,
                        'fname':fnameController.text,
                        'email':emailController.text,
                        'phone no':phoneController.text,
                        'gender':genderController.text,
                        'dob':dobController.text,
                        'address':addressController.text,
                        'id':id,


                      }) .then((onValue) {
                        isLoading = false;
                        setState(() {

                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Fetch()));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Admission Form successfully"),
                              backgroundColor: Colors.green,)
                        );

                        setState(() {});
                      }).onError((error,handleError){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("please enter value"),
                              backgroundColor: Colors.red,)
                        );
                        isLoading=false;
                        setState(() {

                        });

                      });
                      if (_formKey.currentState!.validate()) ;
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
