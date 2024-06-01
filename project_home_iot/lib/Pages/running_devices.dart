//Running Devices Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/presenter/feed_presenter.dart';
import 'package:project_home_iot/presenter/group_properties_presenter.dart';
import 'package:project_home_iot/shared/color_constants.dart';
import 'package:project_home_iot/shared/images_constants.dart';
import 'package:provider/provider.dart';

import '../model/objects/device_object.dart';
import '../shared/fontweight_constants.dart';
import '../shared/pages_constants.dart';

class RunningDevicesPage extends StatefulWidget {
  const RunningDevicesPage({super.key});

  @override
  State<RunningDevicesPage> createState() => _RunningDevicesPageState();
}

class _RunningDevicesPageState extends State<RunningDevicesPage> {
  final FeedPresenter _feedPresenter = FeedPresenter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorConstants.normalBlack,
    ));

    return Scaffold(
        backgroundColor: ColorConstants.normalBlack,
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
      icon: Image.asset(ImageConstants.returnButton),
      onPressed: () => {
        if (Navigator.canPop(context)) {Navigator.pop(context)}
      },
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Text(
        'Running Devices',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeightConstants.bold,
          color: ColorConstants.normalWhite,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget _renderDevices(BuildContext context, State<RunningDevicesPage> state) {
    List<Map<String, String>> listDevices = [
      {
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": PagesConstants.lightAdjustments
      },
      {
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": PagesConstants.lightAdjustments
      },
      {
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": PagesConstants.fanAdjustments
      },
      {
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": PagesConstants.lightAdjustments
      },
      {
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": PagesConstants.lightAdjustments
      },
      {
        "time": "Running from 1 hr",
        "access": "4 Members has access",
        "to": PagesConstants.lightAdjustments
      },
    ];
    return Consumer<GroupPropertiesPresenter>(
        builder: (context, properties, child) {
      return GridView.builder(
        itemCount: properties.deviceObject.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        itemBuilder: (context, index) {
          DeviceObject deviceObject = DeviceObject(
              name: properties.deviceObject[index].name,
              status: properties.deviceObject[index].status,
              room: properties.deviceObject[index].room,
              image: properties.deviceObject[index].image,
              value: properties.deviceObject[index].value);
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.lightBlack,
              ),
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              padding: const EdgeInsets.only(left: 6.0, top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Image.asset(deviceObject.image.last)),
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
                          deviceObject.room.last,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeightConstants.semiBold,
                            color: ColorConstants.normalWhite,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        Text(
                          listDevices[index]["time"]!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeightConstants.medium,
                            color: ColorConstants.normalWhite,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        Text(
                          listDevices[index]["access"]!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeightConstants.medium,
                            color: ColorConstants.lightGray,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: bool.parse(deviceObject.status.last),
                      onChanged: (value) {
                        state.setState(() {
                          deviceObject.status.last = value.toString();
                          _feedPresenter.sendLatestData(
                              deviceObject.status.first, value.toString());
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
    });
  }
}
