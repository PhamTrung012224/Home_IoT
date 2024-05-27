//On Boarding Page
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_home_iot/shared/constants.dart' as constants;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  void _startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, constants.home);
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
      statusBarColor: constants.lightBlack,
    ));
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(constants.onBoard)),
        ],
      ),
    );
  }
}
