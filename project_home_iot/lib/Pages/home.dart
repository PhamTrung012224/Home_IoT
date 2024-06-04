//Home Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/Pages/fan_adjustments.dart';
import 'package:project_home_iot/Pages/light_adjustments.dart';
import 'package:project_home_iot/Pages/usage_meter.dart';
import 'package:project_home_iot/model/objects/device_object.dart';
import 'package:project_home_iot/presenter/feed_presenter.dart';
import 'package:project_home_iot/presenter/group_properties_presenter.dart';
import 'package:project_home_iot/presenter/weather_presenter.dart';
import 'package:project_home_iot/shared/color_constants.dart';
import 'package:project_home_iot/shared/fontweight_constants.dart';
import 'package:provider/provider.dart';

import '../shared/images_constants.dart';
import '../shared/pages_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FeedPresenter _feedPresenter = FeedPresenter();
  late double lat;
  late double lon;
  final WeatherPresenter _weatherPresenter =
      WeatherPresenter(lat: '0', lon: '0');

  Future<Position> getCurrentLocation() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Weather services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot use weather service');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();

    getCurrentLocation().then((value) {
      lat = value.latitude;
      lon = value.longitude;
      _weatherPresenter.updateLocation(lat.toString(), lon.toString());
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _feedPresenter.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorConstants.lightBlack,
    ));
    var screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FeedPresenter>(
          create: (_) => _feedPresenter,
        ),
        ChangeNotifierProvider<WeatherPresenter>(
          create: (_) => _weatherPresenter,
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorConstants.lightBlack,
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
        color: ColorConstants.normalBlack,
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
                maxHeight: childrenHeight, maxWidth: screenWidth * 0.15),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.normalBlue,
            ),
            margin: const EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeightConstants.medium,
                color: ColorConstants.normalWhite,
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
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.normalBlack,
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.32,
          maxWidth: screenWidth,
        ),
        margin: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        child: GridView.count(
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
          crossAxisCount: 3,
          children: [
            _renderTemperature(context),
            _renderIlluminance(context),
            _renderUsageMeterBtn(context),
            _renderUsageMeter(context),
            _renderHumidity(context),
            _renderWeather(context)
          ],
        ));
  }

  Widget _renderTemperature(BuildContext context) {
    return Consumer<FeedPresenter>(builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorConstants.normalBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: Text('${value.temperature?.value ?? 0}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeightConstants.semiBold,
                        color: ColorConstants.normalWhite,
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
                  fontWeight: FontWeightConstants.normal,
                  color: ColorConstants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _renderIlluminance(BuildContext context) {
    return Consumer<FeedPresenter>(builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorConstants.normalBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: Text('${value.illuminance?.value ?? 0}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeightConstants.semiBold,
                        color: ColorConstants.normalWhite,
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
                  fontWeight: FontWeightConstants.normal,
                  color: ColorConstants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _renderUsageMeterBtn(BuildContext context) {
    return IconButton(
      alignment: Alignment.topRight,
      icon: Image.asset(ImageConstants.menuButton),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => const UsageMeterPage());
      },
    );
  }

  Widget _renderUsageMeter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: ColorConstants.normalBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Center(child: Image.asset(ImageConstants.usageMeterImage)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Text(
              'Usage Meter',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeightConstants.normal,
                color: ColorConstants.normalWhite,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderHumidity(BuildContext context) {
    return Consumer<FeedPresenter>(builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorConstants.normalBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Text('${value.humidity?.value ?? 0}%',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeightConstants.semiBold,
                        color: ColorConstants.normalWhite,
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
                  fontWeight: FontWeightConstants.normal,
                  color: ColorConstants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _renderWeather(BuildContext context) {
    return Consumer<WeatherPresenter>(builder: (context, weather, child) {
      return Container(
        decoration: BoxDecoration(
          color: ColorConstants.normalWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: ColorConstants.normalYellow,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 5.0, 3.0, 5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        weather.currentWeather?.name ?? 'No Information',
                        style: TextStyle(
                          color: ColorConstants.darkBlack,
                          fontWeight: FontWeightConstants.bold,
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                    Align(
                      child: Text(
                        weather.currentWeather?.weather.first.description ??
                            'No Information',
                        style: TextStyle(
                          color: ColorConstants.darkBlack,
                          fontWeight: FontWeightConstants.medium,
                          fontSize: 10,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${((weather.currentWeather?.main.temp ?? 273.15) - 273.15).toStringAsPrecision(3)}°C",
                  style: TextStyle(
                    color: ColorConstants.darkBlack,
                    fontWeight: FontWeightConstants.bold,
                    fontSize: 22,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _renderDevicesBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PagesConstants.runningDevices)
            .then((value) {
          Provider.of<GroupPropertiesPresenter>(context, listen: false)
              .getDeviceObject();
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                'Running Devices',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeightConstants.medium,
                  color: ColorConstants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeightConstants.normal,
                color: ColorConstants.normalWhite,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderDevices(BuildContext context) {
    return Consumer<GroupPropertiesPresenter>(
        builder: (context, properties, child) {
      return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: properties.deviceObject.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 3.0,
          childAspectRatio: 2.1,
        ),
        itemBuilder: (BuildContext context, int index) {
          DeviceObject deviceObject = DeviceObject(
              name: properties.deviceObject[index].name,
              status: properties.deviceObject[index].status,
              room: properties.deviceObject[index].room,
              image: properties.deviceObject[index].image,
              value: properties.deviceObject[index].value,
              color: properties.deviceObject[index].color,
              speed: properties.deviceObject[index].speed);
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.18),
            child: GestureDetector(
                onTap: () {
                  if (properties.getDeviceName(index).contains('fan')) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context) => FanAdjustmentsPage(
                        deviceObject: deviceObject,
                      ),
                    ))
                        .then((_) {
                      Provider.of<GroupPropertiesPresenter>(context,
                              listen: false)
                          .getDeviceObject();
                    });
                  } else if(properties.getDeviceName(index).contains('light')){
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context) => LightAdjustmentsPage(
                        deviceObject: deviceObject,
                      ),
                    ))
                        .then((_) {
                      Provider.of<GroupPropertiesPresenter>(context,
                              listen: false)
                          .getDeviceObject();
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstants.darkBlack,
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(deviceObject.name.last,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeightConstants.medium,
                            color: ColorConstants.normalWhite,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Text('on for last 4 hours',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeightConstants.normal,
                            color: const Color.fromARGB(255, 183, 182, 182),
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      Expanded(
                          child: Center(
                              child: Image.asset(deviceObject.image.last))),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text(deviceObject.room.last,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeightConstants.normal,
                                  color: ColorConstants.normalWhite,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                )),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Transform.scale(
                                scale: 0.7,
                                child: Switch(
                                    value: bool.parse(deviceObject.status.last),
                                    onChanged: (value) {
                                      setState(() {
                                        deviceObject.status.last =
                                            value.toString();
                                        _feedPresenter.sendLatestData(
                                            deviceObject.status.first,
                                            value.toString());
                                      });
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          );
        },
      );
    });
  }
}
