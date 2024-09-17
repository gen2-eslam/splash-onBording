import 'package:flutter/material.dart';
import 'package:splsh_and_onboarding/main.dart';
import 'package:splsh_and_onboarding/on_boarding_screen.dart';
import 'package:splsh_and_onboarding/test_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Splash.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: const Center(
          child: Text("FARES",
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }
}
