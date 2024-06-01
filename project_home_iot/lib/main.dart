// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_home_iot/model/objects/device_object.dart';
import 'package:project_home_iot/presenter/group_properties_presenter.dart';
import 'package:project_home_iot/shared/color_constants.dart';
import 'package:project_home_iot/shared/pages_constants.dart';
import 'package:provider/provider.dart';
import 'Pages/home.dart';
import 'Pages/fan_adjustments.dart';
import 'Pages/light_adjustments.dart';
import 'Pages/on_boarding.dart';
import 'Pages/running_devices.dart';
import 'Pages/usage_meter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  // This widget is the root of your application.

}

class _MyAppState extends State<MyApp>{
  GroupPropertiesPresenter groupPropertiesPresenter = GroupPropertiesPresenter();


  @override
  void initState() {
    groupPropertiesPresenter.getDeviceObject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => groupPropertiesPresenter,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorConstants.normalBlack,
            useMaterial3: true,
          ),
          initialRoute: PagesConstants.onBoard,
          routes: {
            PagesConstants.onBoard: (context) => const OnboardingPage(),
            //1
            PagesConstants.home: (context) => const HomePage(),
            //2
            PagesConstants.usageMeter: (context) => const UsageMeterPage(),
            PagesConstants.fanAdjustments: (context) => const FanAdjustmentsPage(),
            //3
            PagesConstants.runningDevices: (context) => const RunningDevicesPage(),
            PagesConstants.lightAdjustments: (context) =>
            const LightAdjustmentsPage(),
          },
        ));
  }
}