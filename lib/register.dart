import 'package:flutter/material.dart';
import 'package:hoctap1/login.dart';
import 'package:hoctap1/main.dart';
import 'package:hoctap1/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
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

            // PASSWORD + toggle icon
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
            const SizedBox(height: 15),

            // CONFIRM PASSWORD + toggle icon
            TextField(
              controller: confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_reset_outlined),
                labelText: "Nhập lại mật khẩu",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                String pass = passwordController.text.trim();
                String confirmPass = confirmPasswordController.text.trim();

                if (email.isEmpty || pass.isEmpty || confirmPass.isEmpty) {
                  showMessage(context, "Vui lòng nhập đầy đủ thông tin");
                  return;
                }

                if (pass != confirmPass) {
                  showMessage(context, "Mật khẩu không trùng khớp");
                  return;
                }

                // Tạo body gửi lên API
                var data = {
                  "firstName": "New",
                  "lastName": "User",
                  "age": 20,
                  "email": email,
                  "password": pass,
                  "username": email.split("@")[0], // tạo username từ email
                };

                var result = await AuthService.register(data);

                if (result != null) {
                  showMessage(context, "Đăng ký thành công!");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainScreen(initialIndex: 9),
                    ),
                    (route) => false,
                  ); // quay về trang login kèm menu
                } else {
                  showMessage(context, "Đăng ký thất bại!");
                }
              },

              child: const Text("Tạo tài khoản"),
            ),
          ],
        ),
      ),
    );
  }
}
