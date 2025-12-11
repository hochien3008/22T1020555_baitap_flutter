import 'package:flutter/material.dart';
import 'package:hoctap1/BAITAP1.dart';
import 'package:hoctap1/BAITAP2_2.dart';
import 'package:hoctap1/Baitap2.dart';
import 'package:hoctap1/Bo_dem_thoi_gian_app.dart';
import 'package:hoctap1/change_color_app.dart';
import 'package:hoctap1/dem_so_app.dart';
import 'package:hoctap1/login.dart';
import 'package:hoctap1/my_products.dart';
import 'package:hoctap1/myhomepage.dart';
import 'package:hoctap1/register.dart';
import 'package:hoctap1/tnews_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      // Cấu hình font để hỗ trợ tiếng Việt
      theme: ThemeData(
        fontFamily: 'Roboto', // Font mặc định hỗ trợ tiếng Việt tốt
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final int? initialIndex;

  const MainScreen({super.key, this.initialIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 0;
  }

  final List<Map<String, dynamic>> _screens = [
    {'title': 'Bài tập 1', 'widget': MyHomePage()},
    {'title': 'Bài tập 2', 'widget': Baitap2()},
    {'title': 'Bài tập 3', 'widget': BAITAP1()},
    {'title': 'Bài tập 4', 'widget': BAITAP2_2()},
    {'title': 'Bài tập 5', 'widget': ChangeColorApp()},
    {'title': 'Bài tập 6', 'widget': DemSoApp()},
    {'title': 'Bài tập 7', 'widget': BoDemThoiGianApp()},
    {'title': 'Sản phẩm', 'widget': MyProducts()},
    {'title': 'Đăng ký', 'widget': RegisterPage()},
    {'title': 'Đăng nhập', 'widget': LoginPage()},
    {'title': 'Tin tức', 'widget': NewsListScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_currentIndex]['title'],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Menu Giao Diện',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ...List.generate(
              _screens.length,
              (index) => ListTile(
                leading: Icon(
                  _currentIndex == index
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
                title: Text(
                  _screens[index]['title'],
                  style: TextStyle(
                    fontWeight: _currentIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _currentIndex == index ? Colors.blue : Colors.black,
                  ),
                ),
                selected: _currentIndex == index,
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                  Navigator.pop(context); // Đóng drawer
                },
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens.map((screen) => screen['widget'] as Widget).toList(),
      ),
    );
  }
}
