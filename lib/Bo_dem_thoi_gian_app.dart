import 'dart:async';
import 'package:flutter/material.dart';

class BoDemThoiGianApp extends StatefulWidget {
  const BoDemThoiGianApp({super.key});

  @override
  State<BoDemThoiGianApp> createState() => _BoDemThoiGianAppState();
}

class _BoDemThoiGianAppState extends State<BoDemThoiGianApp> {
  final _controller = TextEditingController(text: '100');
  int _value = 100;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    final parsed = int.tryParse(_controller.text);
    if (parsed == null || parsed <= 0) return; // bỏ qua nếu nhập không hợp lệ
    setState(() => _value = parsed);

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
          children: const [
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
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Nhập số giây cần đếm',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: 200,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Nhập số giây',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            '$_value',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _toggleTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRunning ? Colors.orange : Colors.grey,
                ),
                child: Row(
                  children: [
                    Icon(
                      _isRunning ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _isRunning ? 'Dừng' : 'Bắt đầu',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _stopTimer();
                  setState(() {
                    _value = 100;
                    _controller.text = '100';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.replay_outlined, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Đặt lại', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
