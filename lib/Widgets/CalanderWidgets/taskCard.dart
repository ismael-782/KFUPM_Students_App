import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final DateTime taskDate;

  TaskCard({required this.taskName, required this.taskDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(
                      34, 56, 67, 1), // Set your desired text color
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Date: ${taskDate.day}/${taskDate.month}/${taskDate.year}',
                style: GoogleFonts.rubik(
                  color: Color.fromARGB(255, 77, 75, 75),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
