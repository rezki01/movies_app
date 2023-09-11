import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.login,
      (route) => false,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              AssetPath.splashImage,
              width: 189,
            ),
          ),
        ),
      ),
    );
  }
}
