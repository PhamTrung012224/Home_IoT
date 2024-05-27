//Light Adjustments Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

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
    colorPicker = Colors.white;
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
      icon: Image.asset('assets/images/Return.png'),
      onPressed: () => {Navigator.pushNamed(context, '/home')},
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0,bottom: 14.0),
      child: Text(
        'Light Adjustments',
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

  Widget _renderColorPicker(BuildContext context,
      State<LightAdjustmentsPage> state) {
    return Padding(
      padding: const EdgeInsets.only(bottom:55.0),
      child: Container(
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
           color: const Color.fromRGBO(34, 34, 36, 1),
        ),
        child: ColorPicker(
          // ignore: deprecated_member_use
          labelTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
