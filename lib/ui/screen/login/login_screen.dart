import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/ui/ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.background,
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 150,
          ),
          children: [
            const Center(
              child: Text(
                'Siap Menonton?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                'Masukkan email dan password untuk membuat atau masuk ke akunmu',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
            TextFieldWidget(
              controller: emailController,
              label: 'Email',
              radius: 0,
              obscureText: false,
              isFilled: true,
              fillColor: Colors.white,
              prefix: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email harus di isi';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              controller: passwordController,
              label: 'Password',
              radius: 0,
              obscureText: true,
              isFilled: true,
              fillColor: Colors.white,
              prefix: const Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Password harus di isi';
                }
                if (value.length < 6) {
                  return 'Password min 6 chacacter';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {},
              child: const Text(
                'Lupa Password?',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.home,
                    (route) => false,
                  );
                }
              },
              child: const Text(
                "MASUK",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Belum punya akun?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    ' Daftar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
