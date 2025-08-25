import 'package:firebase/views/weather/wath2.dart';
import 'package:flutter/material.dart';
class PickLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b0629),
      appBar: AppBar(
        backgroundColor: Color(0xff302b4f) ,
        title: Text("Pick Location",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForecastScreen()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Find the area or city that you want\n to know the detailed weather info at this time',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image(image: AssetImage('assets/13.jpg')),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302b4f) ,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(

                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [

                  locationCard("Montreal, Canada", "8°", Icons.ac_unit),
                  locationCard("Tokyo, Japan", "12°", Icons.thunderstorm),
                  locationCard("Taipei, Taiwan", "20°", Icons.cloud),
                  locationCard("Toronto, Canada", "12°", Icons.tornado),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget locationCard(String city, String temp, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff302b4f) ,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(temp, style: TextStyle(color: Colors.white, fontSize: 24)),
          SizedBox(height: 8),
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 8),
          Text(city,
              style: TextStyle(color: Colors.white70), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
