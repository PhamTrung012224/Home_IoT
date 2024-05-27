//Light Adjustments Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/shared/constants.dart' as constants;

class LightAdjustmentsPage extends StatefulWidget {
  const LightAdjustmentsPage({super.key});

  @override
  State<LightAdjustmentsPage> createState() => _LightAdjustmentsPageState();
}

class _LightAdjustmentsPageState extends State<LightAdjustmentsPage> {
  bool? isOnSwitch;
  Color? colorPicker;

  @override
  void initState() {
    super.initState();
    isOnSwitch = false;
    colorPicker = constants.normalWhite;
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
              _renderBtn(context),
              _renderTitle(context),
              _renderSubTitle(context, this),
              Expanded(
                child: _renderColorPicker(
                    context, this),
              )
            ],
          ),
        ));
  }

  Widget _renderBtn(BuildContext context) {
    return IconButton(
      icon: Image.asset(constants.returnButton),
      onPressed: () => {Navigator.pushNamed(context, constants.home)},
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0,bottom: 14.0),
      child: Text(
        'Light Adjustments',
        style: TextStyle(
          fontSize: 24,
          fontWeight: constants.bold,
          color: constants.normalWhite,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget _renderSubTitle(BuildContext context,
      State<LightAdjustmentsPage> state) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Light- Living Room',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: constants.bold,
                      color: constants.normalWhite,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                Text('on for last three hours',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: constants.medium,
                      color: constants.lightGray,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                Text('Consumed 8 units',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: constants.medium,
                      color: constants.lightGray,
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
            activeColor: constants.green,
          ),
        ),
      ],
    );
  }

  Widget _renderColorPicker(BuildContext context,
      State<LightAdjustmentsPage> state) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
        child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
             color: constants.lightBlack,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:12.0,left: 12.0,bottom: 12.0),
                child: Text('Colours',
                style: TextStyle(
                  fontSize: 18,
                  color: constants.normalWhite,
                  fontWeight: constants.semiBold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                ),
              ),
              ColorPicker(
                // ignore: deprecated_member_use
                labelTextStyle: TextStyle(
                  color: constants.normalWhite,
                  fontWeight: constants.semiBold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                pickerAreaBorderRadius: BorderRadius.circular(180),
                pickerColor: colorPicker!,
                onColorChanged: (value) {
                  setState(() {
                    colorPicker = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
