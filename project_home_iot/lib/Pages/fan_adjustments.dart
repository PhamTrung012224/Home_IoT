//Fan Adjustments Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FanAdjustmentsPage extends StatefulWidget {
  const FanAdjustmentsPage({super.key});

  @override
  State<FanAdjustmentsPage> createState() => _FanAdjustmentsPageState();
}

class _FanAdjustmentsPageState extends State<FanAdjustmentsPage> {
  bool ?isOnSwitch;
  double ?fanSpeed;

  @override
  void initState() {
    super.initState();
    isOnSwitch=false;
    fanSpeed=0.0;
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
              _renderSubTitle(context,this),
              _renderFanController(context, this),
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
      padding: const EdgeInsets.only(left:12.0),
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

  Widget _renderSubTitle(BuildContext context,
      State<FanAdjustmentsPage> state) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Fan- Living Room',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                Text('on for last three hours',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white54,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                Text('Consumed 8 units',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white54,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:12.0),
          child: Switch(
            value: isOnSwitch!,
            onChanged: (value) {
              setState(() {
                isOnSwitch = value;
              });
            },
            activeColor: const Color.fromARGB(255, 5, 255, 51),
          ),
        ),
      ],
    );
  }

  Widget _renderFanController(BuildContext context,State<FanAdjustmentsPage> state){
    return Container(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left:12.0,right:12.0,top:24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 31, 31, 36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:16.0,left: 12.0),
            child: Text(
              'Speed',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: SliderTheme(
            data: const SliderThemeData(
              trackHeight: 30.0,
              thumbColor: Color(0xA8C2C2CB),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
              activeTrackColor: Color(0xA8C2C2CB),
              inactiveTrackColor: Color(0xFF151515),
              rangeTrackShape: RoundedRectRangeSliderTrackShape(),

            ),
            child: Slider(
              value: fanSpeed!,
              onChanged: (value){
                state.setState(() {
                  fanSpeed=value;
                });
              },
            ),
          ),
          )
        ],
      ),
    );
  }
}
