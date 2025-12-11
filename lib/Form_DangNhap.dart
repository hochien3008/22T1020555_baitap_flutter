import 'package:flutter/material.dart';

class FormDangnhap extends StatefulWidget {
  const FormDangnhap({super.key});

  @override
  State<FormDangnhap> createState() => _FormDangnhapState();
}

class _FormDangnhapState extends State<FormDangnhap> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Form Đăng nhập',
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
              controller: _userController,
              decoration: const InputDecoration(
                hintText: "Nhập tài khoản",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập tài khoản!";
                }
                return null;
              },
            ),

            SizedBox(height: 40),

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

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String user = _userController.text;
                  String pass = _passController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Đăng nhập: $user thành công")),
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
                "Đăng nhập",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
