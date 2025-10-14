import 'package:dp_maker/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config_io.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(gradient: MyColors.gradientTD),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              gapBox(10),
              Center(
                child: Image.asset(MyImages.logo, width: 180, height: 180),
              ),
              infoText(
                'Powered by DP Maker',
                alignC: true,
                labelcolor: MyColors.foreground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
