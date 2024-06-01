//On Boarding Page
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_home_iot/shared/color_constants.dart';
import 'package:project_home_iot/shared/pages_constants.dart';

import '../shared/images_constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  void _startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, PagesConstants.home);
    });
  }


  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorConstants.normalBlack,
    ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage(ImageConstants.onBoardingImage))),
        ],
      ),
    );
  }
}
