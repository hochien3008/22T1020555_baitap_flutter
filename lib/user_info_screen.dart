import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:hoctap1/main.dart';

class UserInfoPage extends StatefulWidget {
  final String? token;

  const UserInfoPage({super.key, this.token});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  Map<String, dynamic>? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final data = await getUserInfo();
    setState(() {
      user = data;
    });
  }

  Future<Map<String, dynamic>?> getUserInfo() async {
    // Ưu tiên sử dụng token được truyền vào
    String? token = widget.token;

    // Nếu không có token được truyền, thử lấy từ SharedPreferences
    if (token == null) {
      try {
        final prefs = await SharedPreferences.getInstance();
        token = prefs.getString("token");
      } catch (e) {
        print("Lỗi đọc token từ SharedPreferences: $e");
      }
    }

    if (token == null) {
      print("Không có token để lấy thông tin user");
      return null;
    }

    final url = Uri.parse("https://dummyjson.com/auth/me");
    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => MainScreen(initialIndex: 9)),
              (route) => false,
            ),
          ),
          title: Center(
            child: const Text(
              "Thông tin User",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => MainScreen(initialIndex: 9)),
            (route) => false,
          ),
        ),
        title: Center(
          child: const Text(
            "Thông tin User",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user!["image"]),
              ),
            ),
            const SizedBox(height: 20),

            Text("ID: ${user!["id"]}", style: const TextStyle(fontSize: 18)),
            Text(
              "Username: ${user!["username"]}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Email: ${user!["email"]}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Họ tên: ${user!["firstName"]} ${user!["lastName"]}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Giới tính: ${user!["gender"]}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
