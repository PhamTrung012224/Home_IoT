//Home Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/Pages/usage_meter.dart';

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
        MediaQuery.of(context).padding.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderWelcome(context, screenHeight, screenWidth),
            _renderDashboard(context, screenHeight, screenWidth),
            _renderDevicesBtn(context),
            Expanded(child: _renderDevices(context))
          ],
        ),
      ),
    );
  }

  //Widget 1
  Widget _renderWelcome(
      BuildContext context, var screenHeight, var screenWidth) {
    var childrenHeight = screenHeight * 0.1 - 8;
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
                maxHeight: childrenHeight,maxWidth: screenWidth*0.15),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 10, 132, 255),
            ),
            margin: const EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
          ),
          Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderDashboard(
      BuildContext context, var screenHeight, var screenWidth) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 21, 21, 21),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height*0.32,
          maxWidth: screenWidth,
        ),
        margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        child: GridView.count(
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
          crossAxisCount: 3,
          children: [
            _renderTemperature(
                context),
            _renderIlluminance(
                context),
            _renderUsageMeterBtn(context),
            _renderUsageMeter(
                context),
            _renderHumidity(
                context),
            _renderWeather(context)
          ],
        ));
  }

  Widget _renderTemperature(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Center(
                child: Text('30',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
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
        ],
      ),
    );
  }

  Widget _renderIlluminance(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:12),
              child: Center(
                child: Text('25',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
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
        ],
      ),
    );
  }

  Widget _renderUsageMeterBtn(BuildContext context) {
    return IconButton(
      alignment: Alignment.topRight,
      icon: Image.asset('assets/images/Menu.png'),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder:  (BuildContext context)=> const UsageMeterPage()
        );
      },
    );
  }

  Widget _renderUsageMeter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Center(
                child:Image.asset('assets/images/UM.png')
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
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
        ],
      ),
    );
  }

  Widget _renderHumidity(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromARGB(255, 10, 132, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Center(
                child: Text('68%',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
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
        ],
      ),
    );
  }

  Widget _renderWeather(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/weather.png'),
    );
  }

  Widget _renderDevicesBtn(
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/runningDevices');
              },
              child: Text(
                'Running Devices',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/runningDevices');
            },
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
        ],
      ),
    );
  }

  Widget _renderDevices(
      BuildContext context) {
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
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listDevices.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 3.0,
        childAspectRatio: 2.1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom:MediaQuery.of(context).size.height*0.18),
          child: GestureDetector(
              onTap: () =>
                  {Navigator.pushNamed(context, listDevices[index]['to']!)},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 17, 17, 18),
                ),
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                padding: const EdgeInsets.only(top: 12.0, left: 12.0,right: 12.0),
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
                    Expanded(child: Center(child: Image.asset(listDevices[index]['image']!))),
                    Padding(
                      padding: const EdgeInsets.only(bottom:12.0),
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
              )),
        );
      },
    );
  }
}
