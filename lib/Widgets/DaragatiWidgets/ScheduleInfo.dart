import 'package:flutter/material.dart';
import 'package:flutter_tournament/Models/schedule_blueprint.dart';
import 'package:google_fonts/google_fonts.dart';


class ScheduleData extends StatelessWidget {
  const ScheduleData(this.selectedSchedule, {super.key});

  final List<ScheduleInfo> selectedSchedule;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: selectedSchedule.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                  width: 70,
                                  height: 70,
                                  color:
                                      const Color.fromARGB(31, 247, 168, 156),
                                  child: Image.network(
                                      selectedSchedule[index].docImage)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedSchedule[index].courseName,
                                  style:  GoogleFonts.rubik(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  selectedSchedule[index].docName,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  selectedSchedule[index].time,
                                  style:  GoogleFonts.rubik(
                                      color: Color.fromARGB(255, 10, 69, 117),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  selectedSchedule[index].building,
                                  style:  GoogleFonts.rubik(
                                    color: Color.fromARGB(255, 82, 82, 82),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  selectedSchedule[index].room,
                                  style:  GoogleFonts.rubik(
                                    color: Color.fromARGB(255, 82, 82, 82),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
  }
}