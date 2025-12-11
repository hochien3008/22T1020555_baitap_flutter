import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color bgColor = Colors.purple;
  String bgColorString = 'Tím';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Color App'),
        backgroundColor: Colors.yellow,
      ),
      body: myBody(),
    );
  }

  List<Color> listColor = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];
  List<String> listColorString = [
    'Đỏ',
    'Xanh dương',
    'Xanh lá',
    'Vàng',
    'Tím',
    'Cam',
    'Hồng',
  ];

  void _changeColor() {
    var rand = Random();
    var i = rand.nextInt(listColor.length);
    bgColorString = listColorString[i];
    setState(() {
      bgColor = listColor[i];
      bgColorString = listColorString[i];
    });
  }

  Widget myBody() {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Màu nền:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            bgColorString,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _changeColor,
                child: Text('Change Color'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = Colors.purple;
                    bgColorString = 'Tím';
                  });
                },
                child: Text("dặt lại"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
