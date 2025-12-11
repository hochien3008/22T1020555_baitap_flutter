import 'package:hoctap1/services/auth_service.dart';
import 'package:hoctap1/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  void showMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // EMAIL
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // PASSWORD + icon toggle
            TextField(
              controller: passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: "Mật khẩu",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () async {
                String username = emailController.text.trim();
                String pass = passwordController.text.trim();

                if (username.isEmpty || pass.isEmpty) {
                  showMessage(context, "Vui lòng nhập đầy đủ");
                  return;
                }

                var user = await AuthService.login(username, pass);

                if (user != null) {
                  showMessage(context, "Đăng nhập thành công!");

                  // In ra token / thông tin user
                  print("TOKEN = ${user['accessToken']}");
                  print("USER = ${user['username']}");

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserInfoPage(token: user['accessToken']),
                    ),
                  );
                } else {
                  showMessage(context, "Sai tài khoản hoặc lỗi kết nối");
                }
              },

              child: const Text("Đăng nhập"),
            ),
            const SizedBox(height: 25),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterPage()),
                );
              },
              child: const Text("Chưa có tài khoản? Đăng ký"),
            ),
          ],
        ),
      ),
    );
  }
}

// username: 'emilys',
// password: 'emilyspass',
