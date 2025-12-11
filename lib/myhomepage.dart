import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1471115853179-bb1d604434e0?ixlib=rb-1.2.1&q=80&auto=format&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjIzOTI1fQ',
            ),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      'Kandersteg, Switzerland',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star, color: Colors.red, size: 30),
                    Text('41', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.call, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('CALL', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.near_me, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('ROUTE', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('SHARE', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
