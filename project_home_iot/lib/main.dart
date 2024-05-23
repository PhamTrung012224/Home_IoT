import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:async';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 34, 34, 36),
    ));
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 34, 34, 36),
    ));
    var screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        28;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            wigetH1(context, screenHeight, screenWidth),
            wigetH2(context, screenHeight, screenWidth),
            wigetH3(context, screenHeight, screenWidth),
            wigetH4(context, screenHeight, screenWidth)
          ],
        ),
      ),
    );
  }

  //Widget 1
  Widget wigetH1(BuildContext context, var screenHeight, var screenWidth) {
    var childrenHeight = screenHeight * 0.1 - 8;
    var childrenWidth = screenWidth - 28;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 21, 21, 21),
      ),
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.1,
        maxWidth: screenWidth,
      ),
      margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
                maxHeight: childrenHeight, maxWidth: childrenWidth * 0.2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 10, 132, 255),
            ),
            margin: const EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
          ),
          Container(
            constraints: BoxConstraints(
                maxHeight: childrenHeight, maxWidth: childrenWidth * 0.8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget wigetH2(BuildContext context, var screenHeight, var screenWidth) {
    var childrenHeight = screenHeight * 0.4 - 96;
    var childrenWidth = screenWidth - 80;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 21, 21, 21),
        ),
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.4,
          maxWidth: screenWidth,
        ),
        margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        child: Column(
          children: [
            Row(
              children: [
                widgetHR1(context, childrenWidth * 0.33, childrenHeight * 0.5),
                widgetHR2(context, childrenWidth * 0.33, childrenHeight * 0.5),
                widgetHR3(context, childrenWidth * 0.34, childrenHeight * 0.5)
              ],
            ),
            Row(
              children: [
                widgetHR4(context, childrenWidth * 0.33, childrenHeight * 0.5),
                widgetHR5(context, childrenWidth * 0.33, childrenHeight * 0.5),
                widgetHR6(context, childrenWidth * 0.34, childrenHeight * 0.5)
              ],
            )
          ],
        ));
  }

  Widget widgetHR1(BuildContext context, var width, var height) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.75,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
              child: Text('30',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  )),
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.25,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Temperature',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetHR2(BuildContext context, var width, var height) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.75,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
              child: Text('25',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  )),
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.25,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Illuminance',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetHR3(BuildContext context, var width, var height) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      margin: const EdgeInsets.all(4.0),
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Image.asset('assets/images/Menu.png'),
        onPressed: () => {Navigator.pushNamed(context, '/usageMeter')},
      ),
    );
  }

  Widget widgetHR4(BuildContext context, var width, var height) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.75,
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20.0),
                child: const Image(image: AssetImage('assets/images/UM.png'))),
          ),
          SizedBox(
            width: width,
            height: height * 0.25,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Usage Meter',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetHR5(BuildContext context, var width, var height) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      margin: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * 0.75,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
              child: Text('68%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  )),
            ),
          ),
          SizedBox(
            width: width,
            height: height * 0.25,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Humidity',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetHR6(BuildContext context, var width, var height) {
    return Container(
      alignment: Alignment.centerRight,
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      margin: const EdgeInsets.all(4.0),
      child: const Image(
        image: AssetImage('assets/images/weather.png'),
      ),
    );
  }

  Widget wigetH3(BuildContext context, var screenHeight, var screenWidth) {
    var childrenHeight = screenHeight - 8;
    var childrenWidth = screenWidth;
    return Container(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.07,
          maxWidth: screenWidth,
        ),
        margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: Row(
          children: [
            Container(
                constraints: BoxConstraints(
                  maxHeight: childrenHeight,
                  maxWidth: childrenWidth * 0.5,
                ),
                child: Text(
                  'Running Devices',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                )),
            Container(
              constraints: BoxConstraints(
                maxHeight: childrenHeight,
                maxWidth: childrenWidth * 0.5 + 28,
              ),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, '/runningDevices')},
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget wigetH4(BuildContext context, var screenHeight, var screenWidth) {
    var childrenHeight = screenHeight * 0.43;
    return Container(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.43,
          maxWidth: screenWidth,
        ),
        margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
        child: Column(children: [
          Container(
            constraints: BoxConstraints(
                maxHeight: childrenHeight * 0.6, maxWidth: screenWidth),
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 1,
              childAspectRatio: 1.15,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('    Light',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('    on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.6 - 10,
                            maxWidth: screenWidth),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('assets/images/Light.png'),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/lightAdjustments')
                          },
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text('    Living Room',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('    AC',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('    on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.6 - 10,
                            maxWidth: screenWidth),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('assets/images/AC.png'),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/lightAdjustments')
                          },
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text('    Living Room',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('    Fan',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('    on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.6 - 10,
                            maxWidth: screenWidth),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('assets/images/fan.png'),
                          onPressed: () =>
                              {Navigator.pushNamed(context, '/fanAdjustments')},
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text('    Living Room',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('    AC',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('    on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.6 - 10,
                            maxWidth: screenWidth),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('assets/images/AC.png'),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/lightAdjustments')
                          },
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text('    Bedroom',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('    Light',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('    on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.6 - 10,
                            maxWidth: screenWidth),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('assets/images/Light.png'),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/lightAdjustments')
                          },
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text('    Balcony',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('    Light',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('    on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.6 - 10,
                            maxWidth: screenWidth),
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Image.asset('assets/images/Light.png'),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/lightAdjustments')
                          },
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text('    Kitchen',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
                maxHeight: childrenHeight * 0.4, maxWidth: screenWidth),
          )
        ]));
  }
}

//Usage Meter Page
class UsageMeterPage extends StatefulWidget {
  const UsageMeterPage({super.key});

  @override
  State<UsageMeterPage> createState() => _UsageMeterPageState();
}

class _UsageMeterPageState extends State<UsageMeterPage> {
  List<String> date = ['Today', 'Yesterday', 'Last 7 days', 'Last 30 days'];
  // ignore: prefer_typing_uninitialized_variables
  var val;

  @override
  void initState() {
    super.initState();
    val = date.first;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 125, 124, 124),
    ));
    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    var childrenHeight = screenHeight * 0.7;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 124, 124),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.3,
                maxWidth: screenWidth,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 125, 124, 124),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.7,
                maxWidth: screenWidth,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 36),
              ),
              child: Column(
                children: [
                  widgetU1(context, childrenHeight * 0.1, screenWidth, this),
                  widgetU2(context, childrenHeight * 0.78, screenWidth),
                  widgetU3(context, childrenHeight * 0.12, screenWidth)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  widgetU1(BuildContext context, var height, var width,
      State<UsageMeterPage> stateU1) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.6, color: Color.fromARGB(77, 217, 217, 217)))),
        child: Row(
          children: [
            Container(
                constraints:
                    BoxConstraints(maxHeight: height, maxWidth: width * 0.15),
                margin: const EdgeInsets.only(left: 12.0),
                child: const Image(
                  image: AssetImage('assets/images/UM.png'),
                )),
            Container(
              constraints:
                  BoxConstraints(maxHeight: height, maxWidth: width * 0.4),
              margin: const EdgeInsets.only(left: 6.0),
              child: Text(
                'Usage meter',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Container(
              constraints:
                  BoxConstraints(maxHeight: height, maxWidth: width * 0.35),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 0.0, 8.0),
              child: DropdownButton<String>(
                padding: const EdgeInsets.only(right: 16),
                borderRadius: BorderRadius.circular(20),
                alignment: const Alignment(-1.5, 1),
                value: val,
                iconEnabledColor: const Color.fromARGB(255, 112, 112, 112),
                dropdownColor: Colors.white,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                iconSize: 24,
                icon: Image.asset('assets/images/DA.png'),
                items: date.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  stateU1.setState(() {
                    val = value!;
                  });
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 8.0),
                constraints:
                    BoxConstraints(maxHeight: height, maxWidth: width * 0.15),
                child: IconButton(
                  icon: Image.asset('assets/images/Close.png'),
                  onPressed: () => {Navigator.pushNamed(context, '/home')},
                )),
          ],
        ));
  }

  widgetU2(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 8,
        // semanticChildCount: 8,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 10.0),
          ),
        ],
      ),
    );
  }

  widgetU3(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.6,
          color: Color.fromARGB(77, 217, 217, 217),
        ),
      )),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(12.0, 0.0, 10.0, 0.0),
      child: Text(
        'Spending more on air conditioner save more by switching ac to the room temperature at night time.',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: const Color.fromARGB(255, 183, 182, 182),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 21, 21, 21),
    ));

    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        body: SafeArea(
          child: Column(
            children: [
              widgetF1(context, screenHeight * 0.07, screenWidth),
              widgetF2(context, screenHeight * 0.07, screenWidth),
              widgetF3(context, screenHeight * 0.86, screenWidth)
            ],
          ),
        ));
  }

  Widget widgetF1(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Image.asset('assets/images/Return.png'),
        onPressed: () => {Navigator.pushNamed(context, '/home')},
      ),
    );
  }

  Widget widgetF2(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(
        'Fan Adjustments',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget widgetF3(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
    );
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 21, 21, 21),
    ));

    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        body: SafeArea(
          child: Column(
            children: [
              widgetR1(context, screenHeight * 0.07, screenWidth),
              widgetR2(context, screenHeight * 0.07, screenWidth),
              widgetR3(context, screenHeight * 0.86, screenWidth)
            ],
          ),
        ));
  }

  Widget widgetR1(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Image.asset('assets/images/Return.png'),
        onPressed: () => {Navigator.pushNamed(context, '/home')},
      ),
    );
  }

  Widget widgetR2(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(
        'Running Devices',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget widgetR3(BuildContext context, var height, var width) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 34, 34, 36),
              ),
              margin: const EdgeInsets.all(15.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 34, 34, 36),
              ),
              margin: const EdgeInsets.all(15.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 34, 34, 36),
              ),
              margin: const EdgeInsets.all(15.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 34, 34, 36),
              ),
              margin: const EdgeInsets.all(15.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 34, 34, 36),
              ),
              margin: const EdgeInsets.all(15.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 34, 34, 36),
              ),
              margin: const EdgeInsets.all(15.0),
            ),
          ],
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 21, 21, 21),
    ));

    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        body: SafeArea(
          child: Column(
            children: [
              widgetL1(context, screenHeight * 0.07, screenWidth),
              widgetL2(context, screenHeight * 0.07, screenWidth),
              widgetL3(context, screenHeight * 0.86, screenWidth)
            ],
          ),
        ));
  }

  Widget widgetL1(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Image.asset('assets/images/Return.png'),
        onPressed: () => {Navigator.pushNamed(context, '/home')},
      ),
    );
  }

  Widget widgetL2(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 14.0),
      child: Text(
        'Light Adjustments',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget widgetL3(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(maxHeight: height, maxWidth: width),
      child: Container(
        constraints: BoxConstraints(maxHeight: height*0.8, maxWidth: width),
        margin: const EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromARGB(255, 34, 34, 36),
        ),
      ),
    );
  }
}
