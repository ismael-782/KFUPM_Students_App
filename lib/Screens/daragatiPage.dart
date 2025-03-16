import 'package:flutter/material.dart';
import 'package:flutter_tournament/Models/schedule_blueprint.dart';
import 'package:flutter_tournament/Widgets/DaragatiWidgets/degreeProgress.dart';
import 'package:flutter_tournament/Widgets/DaragatiWidgets/schedule_widget.dart';
import 'package:flutter_tournament/data/schedule_dummyList.dart';
import 'package:google_fonts/google_fonts.dart';



class DarajatiPage extends StatefulWidget {
  const DarajatiPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DarajatiPageState();
  }
}

class _DarajatiPageState extends State<DarajatiPage> {
  String selectedDay = 'Sunday';

  @override
  Widget build(BuildContext context) {
    List<ScheduleInfo> selectedSchedule =
        scheduleInfo.where((element) => element.day == selectedDay).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title:  Text(
          'My Grades',
          style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 39, 71, 96),
              Color.fromRGBO(34, 56, 67, 1)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: ClipOval(
                child: Container(
                  width: 65.0,
                  height: 65.0,
                  color: Colors.white,
                  child: Image.asset(
                    'lib/images/myImage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 9.0),
              child: Text(
                'Degree Progress ',
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const DegreeProgressWidget(),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                 Text(
                  'Class Schedule',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.black),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 17, 88, 146),
                      width: 2,
                    ),
                  ),
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    value: selectedDay,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDay = newValue!;
                      });
                    },
                    items: <String>[
                      'Sunday',
                      'Monday',
                      'Tuesday',
                      'Wednesday',
                      'Thursday',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(), 
                    icon: const Icon(
                        Icons.arrow_drop_down),
                    iconSize: 20.0, 
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ScheduleWidget(selectedSchedule: selectedSchedule)
          ],
        ),
      ),
    );
  }
}