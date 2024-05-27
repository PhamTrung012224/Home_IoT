//Usage Meter Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_home_iot/shared/constants.dart' as constants;

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
    progressVal = [16, 26, 24, 30, 12, 5, 28, 32];
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
              _renderTitleBar(
                  context,this),
              Expanded(child: _renderDevices(context)),
              _renderQuotes(context)
            ],
          ),
        ),
      ),
    );
  }

  _renderTitleBar(BuildContext context,
      State<UsageMeterPage> stateU1) {
    return Container(
        height: MediaQuery.of(context).size.height*0.07,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.6, color: constants.lightGray))),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left:12.0),
              child: Image(
                image: AssetImage(constants.usageMeterImage),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Usage meter',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: constants.medium,
                  color: constants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.18,top: MediaQuery.of(context).size.height*0.015,bottom: MediaQuery.of(context).size.height*0.015),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: constants.normalWhite,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(20),
                        value: val,
                        iconEnabledColor: constants.darkBlack,
                        dropdownColor: constants.normalWhite,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: constants.normal,
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        iconSize: 24,
                        icon: Image.asset(constants.downArrow),
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
              icon: Image.asset(constants.closeButton),
              onPressed: () {
                if(Navigator.canPop(context)){
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ));
  }

  _renderDevices(BuildContext context) {
    List<Map<String, String>> devicesList = [
      {'deviceImg': constants.airConditioner, 'value': '16 Units'},
      {'deviceImg': constants.lightBulb, 'value': '26 Units'},
      {'deviceImg': constants.fan, 'value': '24 Units'},
      {'deviceImg': constants.cleaner, 'value': '30 Units'},
      {'deviceImg': constants.television, 'value': '12 Units'},
      {'deviceImg': constants.fridge, 'value': '5 Units'},
      {'deviceImg': constants.lightBulb, 'value': '28 Units'},
      {'deviceImg': constants.airConditioner, 'value': '32 Units'},
    ];
    // progressVal = [16, 26, 24, 30, 12, 5, 28, 32];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 9.0,
        mainAxisSpacing: 6.0,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(
                devicesList[index]['deviceImg'].toString(),
                height: 30,
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 10.0),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: progressVal![index] / 38.0,
                    backgroundColor: constants.darkBlack,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ),
              ),
              Text(
                devicesList[index]['value'].toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: constants.medium,
                  color: constants.normalWhite,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _renderQuotes(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.6,
          color: constants.lightGray,
        ),
      )),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(12.0, 0, 10.0, 4.0),
      padding: const EdgeInsets.only(top: 2.0),
      child: Text(
        'Spending more on air conditioner save more by switching ac to the room temperature at night time.',
        style: TextStyle(
          fontSize: 12,
          fontWeight: constants.normal,
          color: constants.lightGray,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }
}
