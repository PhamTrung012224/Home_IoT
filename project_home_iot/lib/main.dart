import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 34, 34, 36),
  ));
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

//On Boarding Page
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _start = 5;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/OBIcon.png')),
            ],
          )),
    );
  }
}

//Home Page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wigetH1(context),
          wigetH2(context),
          wigetH3(context),
          wigetH4(context)
        ],
      ),
    );
  }
}

//Widget 1
Widget wigetH1(BuildContext context) {
  return Container(
    color: Colors.blue,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.1,
      maxWidth: MediaQuery.of(context).size.width,
    ),
  );
}

Widget wigetH2(BuildContext context) {
  return Container(
    color: Colors.green,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.4,
      maxWidth: MediaQuery.of(context).size.width,
    ),
  );
}

Widget wigetH3(BuildContext context) {
  return Container(
    color: Colors.yellow,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.07,
      maxWidth: MediaQuery.of(context).size.width,
    ),
  );
}

Widget wigetH4(BuildContext context) {
  return Container(
    color: Colors.red,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.43,
      maxWidth: MediaQuery.of(context).size.width,
    ),
  );
}

//Usage Meter Page
class UsageMeterPage extends StatefulWidget {
  const UsageMeterPage({super.key});

  @override
  State<UsageMeterPage> createState() => _UsageMeterPageState();
}

class _UsageMeterPageState extends State<UsageMeterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context, '/home')},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 32, 108, 213)),
          ),
          child: Text(
            'Return',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          )),
    ));
  }
}

//Fan Adjustments Page
class FanAdjustmentsPage extends StatefulWidget {
  const FanAdjustmentsPage({super.key});

  @override
  State<FanAdjustmentsPage> createState() => _FanAdjustmentsPageState();
}

class _FanAdjustmentsPageState extends State<FanAdjustmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context, '/home')},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 32, 108, 213)),
          ),
          child: Text(
            'Return',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          )),
    ));
  }
}

//Running Devices Page
class RunningDevicesPage extends StatefulWidget {
  const RunningDevicesPage({super.key});

  @override
  State<RunningDevicesPage> createState() => _RunningDevicesPageState();
}

class _RunningDevicesPageState extends State<RunningDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context, '/home')},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 32, 108, 213)),
          ),
          child: Text(
            'Return',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          )),
    ));
  }
}

//Light Adjustments Page
class LightAdjustmentsPage extends StatefulWidget {
  const LightAdjustmentsPage({super.key});

  @override
  State<LightAdjustmentsPage> createState() => _LightAdjustmentsPageState();
}

class _LightAdjustmentsPageState extends State<LightAdjustmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.topCenter,
      child: ElevatedButton(
          onPressed: () => {Navigator.pushNamed(context, '/home')},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 32, 108, 213)),
          ),
          child: Text(
            'Return',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          )),
    ));
  }
}
