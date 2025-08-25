import 'package:firebase/views/weather/wath2.dart';
import 'package:flutter/material.dart';
class WeatherHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff0b0629),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'Miami, FL',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '18°',
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            SizedBox(height: 20),
            Image.asset('assets/13.jpg', height: 400),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                    (index) => Column(
                  children: [
                    Text(
                      ['01:00', 'Now', '03:00', '04:00', '05:00'][index],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Icon(Icons.cloud, color: Colors.white),
                    SizedBox(height: 8),
                    Text('18°', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xff302b4f) ,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.calendar_today, color: Colors.white),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(Icons.add, color: Colors.deepPurple),
                  ),
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForecastScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
