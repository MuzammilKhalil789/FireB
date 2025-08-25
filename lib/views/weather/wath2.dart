import 'package:firebase/views/weather/hsdhsj.dart';
import 'package:firebase/views/weather/weath1.dart';
import 'package:flutter/material.dart';
class ForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b0629),
      appBar: AppBar(


        backgroundColor:Color(0xff302b4f) ,
        title: Text("Forecast Report",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.push((context), MaterialPageRoute(builder: (context)=>WeatherHomeScreen()));}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        actions: [
         IconButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>PickLocationScreen()));
         }, icon: Icon(Icons.arrow_forward,color: Colors.white,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           Image(image: AssetImage('assets/13.jpg')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                5,
                    (index) => Column(
                  children: [
                    Text(['01:00', 'Now', '03:00', '04:00', '05:00'][index],
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 8),
                    Icon(Icons.cloud, color: Colors.white),
                    SizedBox(height: 8),
                    Text('18°', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ForecastItem(day: "Friday", date: "March,02", temp: "17°", icon: Icons.water_drop),
            ForecastItem(day: "Saturday", date: "March,03", temp: "19°", icon: Icons.cloud),
            ForecastItem(day: "Sunday", date: "March,04", temp: "16°", icon: Icons.flash_on),
            ForecastItem(day: "Monday", date: "March,05", temp: "16°", icon: Icons.flash_on),
          ],
        ),
      ),
    );
  }
}

class ForecastItem extends StatelessWidget {
  final String day, date, temp;
  final IconData icon;

  ForecastItem({required this.day, required this.date, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text("$day", style: TextStyle(color: Colors.white)),
      subtitle: Text(date, style: TextStyle(color: Colors.white70)),
      trailing: Text(temp, style: TextStyle(color: Colors.white)),
    );
  }
}
