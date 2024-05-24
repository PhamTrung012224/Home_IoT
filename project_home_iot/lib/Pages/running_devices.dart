//Running Devices Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RunningDevicesPage extends StatefulWidget {
  const RunningDevicesPage({super.key});

  @override
  State<RunningDevicesPage> createState() => _RunningDevicesPageState();
}

class _RunningDevicesPageState extends State<RunningDevicesPage> {
    List<bool> ?switch1;

    @override
    void initState() {
      super.initState();
      switch1 = [true, true, true, true, true, true];
    }
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
              _renderBackBtn(context, screenHeight * 0.07, screenWidth),
              _renderTitle(context, screenHeight * 0.07, screenWidth),
              _renderDevices(context, screenHeight * 0.86, screenWidth, this)
            ],
          ),
        ));
  }

  Widget _renderBackBtn(BuildContext context, var height, var width) {
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

  Widget _renderTitle(BuildContext context, var height, var width) {
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

  Widget _renderDevices(BuildContext context, var height, var width,
      State<RunningDevicesPage> state) {
    List<Map<String, String>> listDevices = [
      {
        "deviceImg": "assets/images/Light.png",
        "room": "Living Room",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": "/lightAdjustments"
      },
      {
        "deviceImg": "assets/images/AC.png",
        "room": "Living Room",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": "/lightAdjustments"
      },
      {
        "deviceImg": "assets/images/fan.png",
        "room": "Living Room",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": "/lightAdjustments"
      },
      {
        "deviceImg": "assets/images/AC.png",
        "room": "Bedroom",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": "/lightAdjustments"
      },
      {
        "deviceImg": "assets/images/Light.png",
        "room": "Balcony",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": "/lightAdjustments"
      },
      {
        "deviceImg": "assets/images/Light.png",
        "room": "Kitchen",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": "/lightAdjustments"
      },
    ];

    return Container(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        child: GridView.builder(
          itemCount: listDevices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.0),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 34, 34, 36),
                ),
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 60,
                        alignment: Alignment.topLeft,
                        child: Image.asset(listDevices[index]["deviceImg"]!)),
                    Container(
                      padding: const EdgeInsets.only(left: 6.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.blueAccent,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listDevices[index]["room"]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            listDevices[index]["time"]!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            listDevices[index]["access"]!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 34,
                      child: Switch(
                        value: switch1![index],
                        onChanged: (value) {
                          state.setState(() {
                            switch1![index] = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
