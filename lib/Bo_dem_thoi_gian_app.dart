import 'dart:async';
import 'package:flutter/material.dart';

class BoDemThoiGianApp extends StatefulWidget {
  const BoDemThoiGianApp({super.key});

  @override
  State<BoDemThoiGianApp> createState() => _BoDemThoiGianAppState();
}

class _BoDemThoiGianAppState extends State<BoDemThoiGianApp> {
  int _value = 100;
  bool _isRunning = false;
  Timer? _timer;
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_value <= 0) return;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_value > 0) {
        setState(() {
          _value--;
        });
      } else {
        _stopTimer();
      }
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _toggleTimer() {
    if (_isRunning) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timelapse),
            SizedBox(width: 10),
            Text(
              'Bộ đếm thời gian',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        backgroundColor: Colors.blue[700],
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
            'Nhập số giây cần đếm ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Center(child: Text("100")),
          ),
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
                onPressed: _toggleTimer,
                child: Row(
                  children: [
                    Icon(
                      _isRunning ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      _isRunning ? 'Dừng' : 'Bắt đầu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRunning ? Colors.orange : Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _stopTimer();
                  setState(() {
                    _value = 100;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.replay_outlined, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Đặt lại', style: TextStyle(color: Colors.white)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
