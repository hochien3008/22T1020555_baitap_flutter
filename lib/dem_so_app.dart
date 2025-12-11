import 'package:flutter/material.dart';

class DemSoApp extends StatefulWidget {
  const DemSoApp({super.key});

  @override
  State<DemSoApp> createState() => _DemSoAppState();
}

class _DemSoAppState extends State<DemSoApp> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate),
            SizedBox(width: 10),
            Text(
              'Ứng dụng đếm số',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gia tri hien tai: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '$_value',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _value--;
                  });
                },
                child: Row(
                  children: [
                    Text('Giảm', style: TextStyle(color: Colors.white)),
                  ],
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _value = 0;
                  });
                },
                child: Text('Đặt lại', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _value++;
                  });
                },
                child: Text('Tăng', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
