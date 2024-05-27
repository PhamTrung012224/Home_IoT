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
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top- - MediaQuery.of(context).padding.bottom;
    var screenWidth = MediaQuery.of(context).size.width;
    var childrenHeight = screenHeight * 0.7;
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
                    width: 0.6, color: Color.fromARGB(77, 217, 217, 217)))),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left:12.0),
              child: Image(
                image: AssetImage('assets/images/UM.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:45.0,top: 8,bottom: 8),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(20),
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
                ),
              ),
            ),
            IconButton(
              icon: Image.asset('assets/images/Close.png'),
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
                    backgroundColor: const Color.fromARGB(255, 21, 21, 21),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
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
    );
  }

  _renderQuotes(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 0.6,
          color: Color.fromARGB(77, 217, 217, 217),
        ),
      )),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(12.0, 0, 10.0, 4.0),
      padding: const EdgeInsets.only(top: 2.0),
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
