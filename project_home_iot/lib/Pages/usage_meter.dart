//Usage Meter Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/presenter/group_properties_presenter.dart';
import 'package:provider/provider.dart';

import '../model/objects/device_object.dart';
import '../shared/color_constants.dart';
import '../shared/fontweight_constants.dart';
import '../shared/images_constants.dart';

class UsageMeterPage extends StatefulWidget {
  const UsageMeterPage({super.key});

  @override
  State<UsageMeterPage> createState() => _UsageMeterPageState();
}

class _UsageMeterPageState extends State<UsageMeterPage> {
  List<String> date = ['Today', 'Yesterday', 'Last 7 days', 'Last 30 days'];
  // ignore: prefer_typing_uninitialized_variables
  var val;
  List<num>? progressVal;

  @override
  void initState() {
    super.initState();
    val = date.first;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              _renderTitleBar(context, this),
              Expanded(child: _renderDevices(context)),
              _renderQuotes(context)
            ],
          ),
        ),
      ),
    );
  }

  _renderTitleBar(BuildContext context, State<UsageMeterPage> stateU1) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.6, color: ColorConstants.lightGray))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Image(
                image: AssetImage(ImageConstants.usageMeterImage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Usage meter',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeightConstants.medium,
                  color: ColorConstants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.18,
                    top: MediaQuery.of(context).size.height * 0.015,
                    bottom: MediaQuery.of(context).size.height * 0.015,
                    right: 2),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: ColorConstants.normalWhite,
                      borderRadius: BorderRadius.circular(20)),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(20),
                        value: val,
                        iconEnabledColor: ColorConstants.darkBlack,
                        dropdownColor: ColorConstants.normalWhite,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeightConstants.normal,
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        iconSize: 24,
                        icon: Image.asset(ImageConstants.downArrow),
                        items: date.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          stateU1.setState(() {
                            val = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Image.asset(ImageConstants.closeButton),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ));
  }

  _renderDevices(BuildContext context) {
    return Consumer<GroupPropertiesPresenter>(builder: (context, properties, child) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 9.0,
          mainAxisSpacing: 6.0,
        ),
        itemCount: properties.deviceObject.length,
        itemBuilder: (context, index) {
          DeviceObject deviceObject = DeviceObject(
              name: properties.deviceObject[index].name,
              status: properties.deviceObject[index].status,
              room: properties.deviceObject[index].room,
              image: properties.deviceObject[index].image,
              value: properties.deviceObject[index].value);
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset(
                  deviceObject.image.last,
                  height: 30,
                  width: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10.0),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      value: int.parse(deviceObject.value.last) / 38.0,
                      backgroundColor: ColorConstants.darkBlack,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.blueAccent),
                    ),
                  ),
                ),
                Text(
                  '${deviceObject.value.last} Units',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeightConstants.medium,
                    color: ColorConstants.normalWhite,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  _renderQuotes(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.6,
          color: ColorConstants.lightGray,
        ),
      )),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(12.0, 0, 10.0, 4.0),
      padding: const EdgeInsets.only(top: 2.0),
      child: Text(
        'Spending more on air conditioner save more by switching ac to the room temperature at night time.',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeightConstants.normal,
          color: ColorConstants.lightGray,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }
}
