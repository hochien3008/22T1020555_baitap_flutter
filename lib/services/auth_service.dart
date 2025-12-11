import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // LOGIN
  // ======================
  static Future<Map<String, dynamic>?> login(String username, String password) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");

    final response = await http.post(
      url,
      body: {
        "username": username,
        "password": password,
        "expiresInMins": "30"
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", data["accessToken"]);

      return data;
    }
    return null;
  }

  // REGISTER 
  // ======================
  static Future<Map<String, dynamic>?> register(Map<String, dynamic> userData) async {
    final url = Uri.parse("https://dummyjson.com/users/add");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      print("Register Error: ${response.body}");
      return null;
    }
  }
}
