//Home Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/Pages/usage_meter.dart';
import 'package:project_home_iot/presenter/feed_presenter.dart';
import 'package:project_home_iot/presenter/weather_presenter.dart';
import 'package:project_home_iot/shared/constants.dart' as constants;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FeedPresenter feedPresenter = FeedPresenter();
  WeatherPresenter weatherPresenter = WeatherPresenter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      feedPresenter.getLatestTemperature();
      feedPresenter.getLatestIlluminance();
      feedPresenter.getLatestHumidity();
      weatherPresenter.getLatestWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: constants.lightBlack,
    ));
    var screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FeedPresenter>(
          create: (_) => feedPresenter,
        ),
        ChangeNotifierProvider<WeatherPresenter>(
          create: (_) => weatherPresenter,
        ),
      ],
      child: Scaffold(
        backgroundColor: constants.lightBlack,
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
        color: constants.normalBlack,
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
              color: constants.normalBlue,
            ),
            margin: const EdgeInsets.fromLTRB(12.0, 12.0, 0.0, 12.0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: constants.medium,
                color: constants.normalWhite,
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
          color: constants.normalBlack,
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
          color: constants.normalBlue,
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
                        fontWeight: constants.semiBold,
                        color: constants.normalWhite,
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
                  fontWeight: constants.normal,
                  color: constants.normalWhite,
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
          color: constants.normalBlue,
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
                        fontWeight: constants.semiBold,
                        color: constants.normalWhite,
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
                  fontWeight: constants.normal,
                  color: constants.normalWhite,
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
      icon: Image.asset(constants.menuButton),
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
        color: constants.normalBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Center(child: Image.asset(constants.usageMeterImage)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 7.0),
            child: Text(
              'Usage Meter',
              style: TextStyle(
                fontSize: 13,
                fontWeight: constants.normal,
                color: constants.normalWhite,
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
          color: constants.normalBlue,
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
                        fontWeight: constants.semiBold,
                        color: constants.normalWhite,
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
                  fontWeight: constants.normal,
                  color: constants.normalWhite,
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
    return Consumer<WeatherPresenter>(builder: (context,value,child){
      return Container(
        decoration: BoxDecoration(
          color: constants.normalWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                color: constants.normalYellow,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3.0,5.0,3.0,5.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        value.currentWeather?.name??'No Information',
                        style: TextStyle(
                          color: constants.darkBlack,
                          fontWeight: constants.bold,
                          fontSize: 12,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                    Align(
                      child: Text(
                        value.currentWeather?.weather.first.description??'No Information',
                        style: TextStyle(
                          color: constants.darkBlack,
                          fontWeight: constants.medium,
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
                  "${((value.currentWeather?.main.temp ?? 273.15) - 273.15).toStringAsPrecision(3)}°C",
                  style: TextStyle(
                    color: constants.darkBlack,
                    fontWeight: constants.bold,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, constants.runningDevices);
              },
              child: Text(
                'Running Devices',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: constants.medium,
                  color: constants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, constants.runningDevices);
            },
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: constants.normal,
                color: constants.normalWhite,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderDevices(BuildContext context) {
    List<Map<String, String>> listDevices = [
      {
        'devices': 'Light',
        'time': 'on for last 4 hours',
        'image': constants.lightBulb,
        'room': 'Living Room',
        'to': constants.lightAdjustments
      },
      {
        'devices': 'AC',
        'time': 'on for last 4 hours',
        'image': constants.airConditioner,
        'room': 'Living Room',
        'to': constants.lightAdjustments
      },
      {
        'devices': 'Fan',
        'time': 'on for last 4 hours',
        'image': constants.fan,
        'room': 'Living Room',
        'to': constants.fanAdjustments
      },
      {
        'devices': 'AC',
        'time': 'on for last 4 hours',
        'image': constants.airConditioner,
        'room': 'Living Room',
        'to': constants.lightAdjustments
      },
      {
        'devices': 'Light',
        'time': 'on for last 4 hours',
        'image': constants.lightBulb,
        'room': 'Balcony',
        'to': constants.lightAdjustments
      },
      {
        'devices': 'Light',
        'time': 'on for last 4 hours',
        'image': constants.lightBulb,
        'room': 'Kitchen',
        'to': constants.lightAdjustments
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
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.18),
          child: GestureDetector(
              onTap: () =>
                  {Navigator.pushNamed(context, listDevices[index]['to']!)},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: constants.darkBlack,
                ),
                margin: const EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 14.0),
                padding:
                    const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listDevices[index]['devices']!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: constants.medium,
                          color: constants.normalWhite,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        )),
                    Text(listDevices[index]['time']!,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: constants.normal,
                          color: const Color.fromARGB(255, 183, 182, 182),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        )),
                    Expanded(
                        child: Center(
                            child: Image.asset(listDevices[index]['image']!))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(listDevices[index]['room']!,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: constants.normal,
                            color: constants.normalWhite,
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
