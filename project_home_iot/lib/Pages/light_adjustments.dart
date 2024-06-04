//Light Adjustments Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/model/objects/device_object.dart';

import '../presenter/feed_presenter.dart';
import '../shared/color_constants.dart';
import '../shared/fontweight_constants.dart';
import '../shared/images_constants.dart';

class LightAdjustmentsPage extends StatefulWidget {
  final DeviceObject? deviceObject;
  const LightAdjustmentsPage({super.key, this.deviceObject});

  @override
  State<LightAdjustmentsPage> createState() => _LightAdjustmentsPageState();
}

class _LightAdjustmentsPageState extends State<LightAdjustmentsPage> {
  Color? colorPicker;
  final FeedPresenter _feedPresenter = FeedPresenter();

  @override
  void initState() {
    super.initState();
    colorPicker = Color(int.parse(widget.deviceObject!.color!.last.replaceFirst('#', '0xff')));
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
              _renderBtn(context),
              _renderTitle(context),
              _renderSubTitle(context, this),
              Expanded(
                child: _renderColorPicker(context, this),
              )
            ],
          ),
        ));
  }

  Widget _renderBtn(BuildContext context) {
    return IconButton(
      icon: Image.asset(ImageConstants.returnButton),
      onPressed: () => {
        if (Navigator.canPop(context)) {Navigator.pop(context)}
      },
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 14.0),
      child: Text(
        '${widget.deviceObject!.name.last} Adjustments',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeightConstants.bold,
          color: ColorConstants.normalWhite,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  Widget _renderSubTitle(
      BuildContext context, State<LightAdjustmentsPage> state) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${widget.deviceObject!.name.last} - ${widget.deviceObject!.room.last}',
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
                Text('Consumed ${widget.deviceObject!.value.last} Units',
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
          padding: const EdgeInsets.only(right: 12.0),
          child: Switch(
            value: bool.parse(widget.deviceObject!.status.last),
            onChanged: (value) {
              setState(() {
                widget.deviceObject!.status.last = value.toString();
                _feedPresenter.sendLatestData(
                    widget.deviceObject!.status.first, value.toString());
              });
            },
            activeColor: ColorConstants.green,
          ),
        ),
      ],
    );
  }

  Widget _renderColorPicker(
      BuildContext context, State<LightAdjustmentsPage> state) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.lightBlack,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, left: 12.0, bottom: 12.0),
                    child: Text(
                      'Colour Picker',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorConstants.normalWhite,
                        fontWeight: FontWeightConstants.semiBold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _feedPresenter.sendLatestData(
                        widget.deviceObject!.color!.first,
                      '#${colorPicker!.value.toRadixString(16).substring(2)}');
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorConstants.normalWhite,
                      fontWeight: FontWeightConstants.semiBold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ]),
              ColorPicker(
                hexInputBar: true,
                enableAlpha: false,
                // ignore: deprecated_member_use
                labelTextStyle: TextStyle(
                  color: ColorConstants.normalWhite,
                  fontWeight: FontWeightConstants.semiBold,
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
