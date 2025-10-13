import 'package:dp_maker/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import '../config/config_io.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.background,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset(MyImages.onboarding,),
              gapBox(20),
              textHeading24('Welcome to DP Maker App', alignC: true),
              gapBox(5),
              infoText('Help you to create DP \nin offline app within 2 steps.', alignC: true),
              gapBox(40),
              CustomButton(
                label: 'Get Started',
                onPressed: () {
                  Get.offAll(() => const HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
