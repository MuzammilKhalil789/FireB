import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Fetch extends StatefulWidget {
  const Fetch({super.key});

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(stream: FirebaseFirestore.instance.collection('student data').snapshots(),
          builder:(context,snapshot){
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (
                context,index){
              return Card(
                child: ListTile(
                  title: Text(snapshot.data!.docs[index]['name'],style: TextStyle(color: Colors.green,fontSize: 30,fontWeight: FontWeight.bold),),
                  subtitle: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data!.docs[index]['fname']),
                        Text(snapshot.data!.docs[index]['email']),
                        Text(snapshot.data!.docs[index]['phone no']),
                        Text(snapshot.data!.docs[index]['gender']),
                        Text(snapshot.data!.docs[index]['dob']),
                        Text(snapshot.data!.docs[index]['address']),
                      ],
                    ),
                
                ),
              );
            });
          }

      ),
    );
  }
}
