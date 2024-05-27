import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/fan_adjustments.dart';
import 'Pages/light_adjustments.dart';
import 'Pages/on_boarding.dart';
import 'Pages/running_devices.dart';
import 'Pages/usage_meter.dart';
import 'shared/constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: constants.normalBlack,
        useMaterial3: true,
      ),
      initialRoute: constants.onBoard,
      routes: {
        constants.onBoard: (context) => const OnboardingPage(),
        constants.home: (context) => const HomePage(),
        constants.usageMeter: (context) => const UsageMeterPage(),
        constants.fanAdjustments: (context) => const FanAdjustmentsPage(),
        constants.runningDevices: (context) => const RunningDevicesPage(),
        constants.lightAdjustments: (context) => const LightAdjustmentsPage(),
      },
    );
  }
}
