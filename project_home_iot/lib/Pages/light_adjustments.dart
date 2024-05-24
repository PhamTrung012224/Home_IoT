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

    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        body: SafeArea(
          child: Column(
            children: [
              _renderBtn(context, screenHeight * 0.07, screenWidth),
              _renderTitle(context, screenHeight * 0.07, screenWidth),
              _renderSubTitle(context, screenHeight * 0.1, screenWidth, this),
              _renderColorPicker(
                  context, screenHeight * 0.76, screenWidth, this)
            ],
          ),
        ));
  }

  Widget _renderBtn(BuildContext context, var height, var width) {
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

  Widget _renderTitle(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 14.0),
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

  Widget _renderSubTitle(BuildContext context, var height, var width,
      State<LightAdjustmentsPage> state) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 14.0),
        child: Row(
          children: [
            Column(
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
            Container(
              constraints: BoxConstraints(
                maxHeight: height,
                maxWidth: width * 0.5 + 20,
              ),
              alignment: Alignment.centerRight,
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
        ));
  }

  Widget _renderColorPicker(BuildContext context, var height, var width,
      State<LightAdjustmentsPage> state) {
    return Container(
        constraints: BoxConstraints(maxHeight: height, maxWidth: width),
        child: Column(children: [
          Container(
            constraints:
                BoxConstraints(maxHeight: height * 0.8 + 12, maxWidth: width),
            margin: const EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 0.0),
            padding: const EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color.fromARGB(255, 34, 34, 36),
            ),
            child: Column(
              children: [
                ColorPicker(
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
          Container(
            decoration: BoxDecoration(
              color: colorPicker,
              borderRadius: BorderRadius.circular(10.0),
            ),
            constraints: BoxConstraints(
              maxHeight: height * 0.1,
              maxWidth: width,
            ),
            margin: const EdgeInsets.all(12.0),
          ),
        ]));
  }
}
