import 'package:flutter/material.dart';

class FormDangky extends StatefulWidget {
  const FormDangky({super.key});

  @override
  State<FormDangky> createState() => _FormDangkyState();
}

class _FormDangkyState extends State<FormDangky> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();

  bool _obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Form Đăng ký',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Họ tên",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập Họ tên!";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập Email!";
                }
                if (!value.contains("@gmail.com")) {
                  return "Email không hợp lệ!";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passController,
              obscureText: _obscurePass,
              decoration: InputDecoration(
                hintText: "Nhập mật khẩu",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePass ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePass = !_obscurePass;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập mật khẩu!";
                }
                if (value.length < 6) {
                  return "Mật khẩu phải từ 6 ký tự trở lên!";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _repassController,
              obscureText: _obscurePass,
              decoration: InputDecoration(
                hintText: "Xác nhận lại mật khẩu",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePass ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePass = !_obscurePass;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập lại mật khẩu!";
                }
                if (value != _passController.text) {
                  return "Mật khẩu không khớp!";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đăng ký thành công!")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Đăng ký",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
