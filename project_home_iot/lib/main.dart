import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/fan_adjustments.dart';
import 'Pages/light_adjustments.dart';
import 'Pages/on_boarding.dart';
import 'Pages/running_devices.dart';
import 'Pages/usage_meter.dart';


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
        scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 36),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(),
        '/usageMeter': (context) => const UsageMeterPage(),
        '/fanAdjustments': (context) => const FanAdjustmentsPage(),
        '/runningDevices': (context) => const RunningDevicesPage(),
        '/lightAdjustments': (context) => const LightAdjustmentsPage(),
      },
    );
  }
}
