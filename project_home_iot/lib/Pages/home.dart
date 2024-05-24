//Home Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
            _renderWelcome(context, screenHeight, screenWidth),
            _renderDashboard(context, screenHeight, screenWidth),
            _renderDevicesBtn(context, screenHeight, screenWidth),
            _renderDevices(context, screenHeight, screenWidth)
          ],
        ),
      ),
    );
  }

  //Widget 1
  Widget _renderWelcome(
      BuildContext context, var screenHeight, var screenWidth) {
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

  Widget _renderDashboard(
      BuildContext context, var screenHeight, var screenWidth) {
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
                _renderTemp(
                    context, childrenWidth * 0.33, childrenHeight * 0.5),
                _renderIllumi(
                    context, childrenWidth * 0.33, childrenHeight * 0.5),
                widgetHR3(context, childrenWidth * 0.34, childrenHeight * 0.5)
              ],
            ),
            Row(
              children: [
                _renderUsageMeter(
                    context, childrenWidth * 0.33, childrenHeight * 0.5),
                _renderHumi(
                    context, childrenWidth * 0.33, childrenHeight * 0.5),
                widgetHR6(context, childrenWidth * 0.34, childrenHeight * 0.5)
              ],
            )
          ],
        ));
  }

  Widget _renderTemp(BuildContext context, var width, var height) {
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

  Widget _renderIllumi(BuildContext context, var width, var height) {
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

  Widget _renderUsageMeter(BuildContext context, var width, var height) {
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

  Widget _renderHumi(BuildContext context, var width, var height) {
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

  Widget _renderDevicesBtn(
      BuildContext context, var screenHeight, var screenWidth) {
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
                child: TextButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/runningDevices')},
                    child: Text(
                      'Running Devices',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ))),
            Container(
              constraints: BoxConstraints(
                maxHeight: childrenHeight,
                maxWidth: childrenWidth * 0.5,
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

  Widget _renderDevices(
      BuildContext context, var screenHeight, var screenWidth) {
    List<Map<String, String>> listDevices = [
      {
        'devices': 'Light',
        'time': 'on for last 4 hours',
        'image': 'assets/images/Light.png',
        'room': 'Living Room',
        'to': '/lightAdjustments'
      },
      {
        'devices': 'AC',
        'time': 'on for last 4 hours',
        'image': 'assets/images/AC.png',
        'room': 'Living Room',
        'to': '/lightAdjustments'
      },
      {
        'devices': 'Fan',
        'time': 'on for last 4 hours',
        'image': 'assets/images/fan.png',
        'room': 'Living Room',
        'to': '/fanAdjustments'
      },
      {
        'devices': 'AC',
        'time': 'on for last 4 hours',
        'image': 'assets/images/AC.png',
        'room': 'Living Room',
        'to': '/lightAdjustments'
      },
      {
        'devices': 'Light',
        'time': 'on for last 4 hours',
        'image': 'assets/images/Light.png',
        'room': 'Balcony',
        'to': '/lightAdjustments'
      },
      {
        'devices': 'Light',
        'time': 'on for last 4 hours',
        'image': 'assets/images/Light.png',
        'room': 'Kitchen',
        'to': '/lightAdjustments'
      },
    ];
    var childrenHeight = screenHeight * 0.43;
    return Container(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.43,
        maxWidth: screenWidth,
      ),
      margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(maxHeight: childrenHeight * 0.6),
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listDevices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 3.0,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () =>
                    {Navigator.pushNamed(context, listDevices[index]['to']!)},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 17, 17, 18),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listDevices[index]['devices']!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text(listDevices[index]['time']!,
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
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Image.asset(listDevices[index]['image']!),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: childrenHeight * 0.6 * 0.2,
                            maxWidth: screenWidth),
                        child: Text(listDevices[index]['room']!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            )),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
