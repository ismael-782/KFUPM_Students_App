import 'package:flutter/material.dart';
import 'package:flutter_tournament/Models/schedule_blueprint.dart';
import 'package:flutter_tournament/Screens/gpaScreen.dart';
import 'package:flutter_tournament/data/students_data.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key, required this.scheduleInfo});
  final ScheduleInfo scheduleInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title: Text(
          scheduleInfo.courseName,
          style:  GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 26),
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                      width: 70,
                      height: 70,
                      color: const Color.fromARGB(31, 247, 168, 156),
                      child: Image.network(scheduleInfo.docImage)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  scheduleInfo.docName,
                  style:  GoogleFonts.rubik(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  const Icon(Icons.apartment),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    scheduleInfo.docBldg,style: GoogleFonts.rubik(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  const Icon(Icons.apartment),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    scheduleInfo.docRoom, style: GoogleFonts.rubik(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  const Icon(Icons.email),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    scheduleInfo.docEmail, style: GoogleFonts.rubik(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => gpaScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 110,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 221, 221, 221),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child:  Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Text(
                            'Grades',
                            style: GoogleFonts.rubik(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 19,
                            color: Color.fromARGB(255, 99, 93, 93),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                 Column(
                  children: [
                    Text('Absences',
                        style: GoogleFonts.rubik(
                            color: const Color.fromARGB(255, 17, 88, 146),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('3/11',
                        style: GoogleFonts.rubik(
                            color: const Color.fromARGB(255, 17, 88, 146),
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
             Text(
              'Students',
              style: GoogleFonts.rubik(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 29),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: studentInfo.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                  width: 70,
                                  height: 70,
                                  color:
                                      const Color.fromARGB(31, 247, 168, 156),
                                  child: Image.asset(studentInfo[index].image)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  studentInfo[index].name,
                                  style:  GoogleFonts.rubik(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  studentInfo[index].email,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
