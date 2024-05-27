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

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _renderBackBtn(context),
              _renderTitle(context),
              Expanded(child: _renderDevices(context, this))
            ],
          ),
        ));
  }

  Widget _renderBackBtn(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/Return.png'),
      onPressed: () => {Navigator.pushNamed(context, '/home')},
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12),
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

  Widget _renderDevices(BuildContext context,
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

    return GridView.builder(
      itemCount: listDevices.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 34, 34, 36),
            ),
            margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            padding: const EdgeInsets.only(left: 6.0, top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Image.asset(listDevices[index]["deviceImg"]!)),
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
                Transform.scale(
                  scale: 0.7,
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
    );
  }
}
