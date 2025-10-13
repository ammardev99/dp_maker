import 'dart:async';
import 'package:flutter/material.dart';

import '../config/config_io.dart';

class HeroBanner extends StatefulWidget {
  const HeroBanner({super.key});

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<String> banners = [
    MyImages.hero1,
    MyImages.hero2,
    MyImages.hero3,
    MyImages.hero4,
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_controller.hasClients) {
        _currentIndex = (_currentIndex + 1) % banners.length;
        _controller.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: _controller,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(banners[index], fit: BoxFit.contain),
            ),
          );
        },
      ),
    );
  }
}
