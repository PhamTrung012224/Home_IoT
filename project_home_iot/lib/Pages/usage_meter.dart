//Usage Meter Page
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
      statusBarColor: Color.fromARGB(255, 125, 124, 124),
    ));
    var screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    var childrenHeight = screenHeight * 0.7;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 124, 124),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.3,
                maxWidth: screenWidth,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 125, 124, 124),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.7,
                maxWidth: screenWidth,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 34, 34, 36),
              ),
              child: Column(
                children: [
                  _renderTitleBar(
                      context, childrenHeight * 0.1, screenWidth, this),
                  _renderDevices(context, childrenHeight * 0.78, screenWidth),
                  _renderQuotes(context, childrenHeight * 0.12, screenWidth)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _renderTitleBar(BuildContext context, var height, var width,
      State<UsageMeterPage> stateU1) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: height,
          maxWidth: width,
        ),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.6, color: Color.fromARGB(77, 217, 217, 217)))),
        child: Row(
          children: [
            Container(
                constraints:
                    BoxConstraints(maxHeight: height, maxWidth: width * 0.15),
                margin: const EdgeInsets.only(left: 12.0),
                child: const Image(
                  image: AssetImage('assets/images/UM.png'),
                )),
            Container(
              constraints:
                  BoxConstraints(maxHeight: height, maxWidth: width * 0.4),
              margin: const EdgeInsets.only(left: 6.0),
              child: Text(
                'Usage meter',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Container(
              constraints:
                  BoxConstraints(maxHeight: height, maxWidth: width * 0.35),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 0.0, 8.0),
              child: DropdownButton<String>(
                padding: const EdgeInsets.only(right: 16),
                borderRadius: BorderRadius.circular(20),
                alignment: const Alignment(-1.5, 1),
                value: val,
                iconEnabledColor: const Color.fromARGB(255, 112, 112, 112),
                dropdownColor: Colors.white,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                iconSize: 24,
                icon: Image.asset('assets/images/DA.png'),
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
            Container(
                margin: const EdgeInsets.only(left: 8.0),
                constraints:
                    BoxConstraints(maxHeight: height, maxWidth: width * 0.15),
                child: IconButton(
                  icon: Image.asset('assets/images/Close.png'),
                  onPressed: () => {Navigator.pushNamed(context, '/home')},
                )),
          ],
        ));
  }

  _renderDevices(BuildContext context, var height, var width) {
    List<Map<String, String>> devicesList = [
      {'deviceImg': 'assets/images/AC.png', 'value': '16 Units'},
      {'deviceImg': 'assets/images/Light.png', 'value': '26 Units'},
      {'deviceImg': 'assets/images/fan.png', 'value': '24 Units'},
      {'deviceImg': 'assets/images/cleaner.png', 'value': '30 Units'},
      {'deviceImg': 'assets/images/tv.png', 'value': '12 Units'},
      {'deviceImg': 'assets/images/fridge.png', 'value': '5 Units'},
      {'deviceImg': 'assets/images/Light.png', 'value': '28 Units'},
      {'deviceImg': 'assets/images/AC.png', 'value': '32 Units'},
    ];
    // progressVal = [16, 26, 24, 30, 12, 5, 28, 32];
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 9.0,
          mainAxisSpacing: 6.0,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0),
            child: Row(
              children: [
                Image.asset(
                  devicesList[index]['deviceImg'].toString(),
                  height: 30,
                  width: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  constraints: BoxConstraints(
                    maxWidth: width * 0.75 - 14,
                    maxHeight: height,
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: progressVal![index] / 38.0,
                    backgroundColor: const Color.fromARGB(255, 21, 21, 21),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ),
                Text(
                  devicesList[index]['value'].toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _renderQuotes(BuildContext context, var height, var width) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: width,
      ),
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.6,
          color: Color.fromARGB(77, 217, 217, 217),
        ),
      )),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(12.0, 0.0, 10.0, 0.0),
      child: Text(
        'Spending more on air conditioner save more by switching ac to the room temperature at night time.',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: const Color.fromARGB(255, 183, 182, 182),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }
}
