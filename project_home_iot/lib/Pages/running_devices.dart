//Running Devices Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/shared/constants.dart' as constants;

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
      statusBarColor: constants.normalBlack,
    ));

    return Scaffold(
        backgroundColor: constants.normalBlack,
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
      icon: Image.asset(constants.returnButton),
      onPressed: () => {Navigator.pushNamed(context, constants.home)},
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12),
      child: Text(
        'Running Devices',
        style: TextStyle(
          fontSize: 24,
          fontWeight: constants.bold,
          color: constants.normalWhite,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget _renderDevices(BuildContext context,
      State<RunningDevicesPage> state) {
    List<Map<String, String>> listDevices = [
      {
        "deviceImg": constants.lightBulb,
        "room": "Living Room",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": constants.lightAdjustments
      },
      {
        "deviceImg": constants.airConditioner,
        "room": "Living Room",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": constants.lightAdjustments
      },
      {
        "deviceImg": constants.fan,
        "room": "Living Room",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": constants.fanAdjustments
      },
      {
        "deviceImg": constants.airConditioner,
        "room": "Bedroom",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": constants.lightAdjustments
      },
      {
        "deviceImg": constants.lightBulb,
        "room": "Balcony",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": constants.lightAdjustments
      },
      {
        "deviceImg": constants.lightBulb,
        "room": "Kitchen",
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": constants.lightAdjustments
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
              color: constants.lightBlack,
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
                          fontWeight: constants.semiBold,
                          color: constants.normalWhite,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        listDevices[index]["time"]!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: constants.medium,
                          color: constants.normalWhite,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                      Text(
                        listDevices[index]["access"]!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: constants.medium,
                          color: constants.lightGray,
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
