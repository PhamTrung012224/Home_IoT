//Fan Adjustments Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
