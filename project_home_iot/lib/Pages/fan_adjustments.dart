//Fan Adjustments Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/color_constants.dart';
import '../shared/fontweight_constants.dart';
import '../shared/images_constants.dart';

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
              _renderSubTitle(context,this),
              _renderFanController(context, this),
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
      padding: const EdgeInsets.only(left:12.0),
      child: Text(
        'Fan Adjustments',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeightConstants.bold,
          color: ColorConstants.normalWhite,
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
                      fontWeight: FontWeightConstants.bold,
                      color: ColorConstants.normalWhite,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                Text('on for last three hours',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeightConstants.medium,
                      color: ColorConstants.lightGray,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                Text('Consumed 8 units',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeightConstants.medium,
                      color: ColorConstants.lightGray,
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
            activeColor: ColorConstants.green,
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
        color: ColorConstants.lightBlack,
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
                color: ColorConstants.normalWhite,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeightConstants.semiBold,
              ),
            ),
          ),
          Expanded(
            child: SliderTheme(
            data: const SliderThemeData(
              trackHeight: 30.0,
              thumbColor: ColorConstants.lightGray,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
              activeTrackColor: ColorConstants.lightGray,
              inactiveTrackColor: ColorConstants.normalBlack,
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
