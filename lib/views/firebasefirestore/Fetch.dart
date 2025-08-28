import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/views/firebasefirestore/Insert.dart';
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
floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdmissionFormScreen()));
}
  ,backgroundColor:Colors.black ,child: Icon(Icons.refresh,color: Colors.orange,),),
      backgroundColor: Color(0xffc3abc7),
      appBar: AppBar(
        title: Text('Fetch Screen',style: TextStyle(color: Color(0xFF9C27B0),fontSize: 30),),
        centerTitle: true,
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection('student data').snapshots(),
          builder:(context,snapshot){
        if (!snapshot.hasData|| snapshot.data!.docs.isEmpty){
          return Center(
            child:Image.asset('assets/nodata.jpg', width: 600),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (
                context,index){
              return Card(
                child: ListTile(
                  onTap: ()async{

                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Are you sure  want to delete',style: TextStyle(color: Colors.black,fontSize: 30),),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('Cancel',style: TextStyle(color: Colors.red,fontSize: 20),)),
                          SizedBox(width: 100,),
                          TextButton(onPressed: ()async{
                            String docId = snapshot.data!.docs[index].id;
                            await FirebaseFirestore.instance.collection('student data').doc(docId).delete();
                            Navigator.pop(context);
                          }, child: Text('Yes',style: TextStyle(color: Colors.blue,fontSize: 20),)),
                        ],
                      );
                    }
                    );
                  },
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
                  trailing:  Text(snapshot.data!.docs[index]['id'])
              ),
              );
                


            });
          }

      ),
    );
  }
}
