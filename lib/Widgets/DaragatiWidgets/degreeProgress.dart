import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/gpaScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class DegreeProgressWidget extends StatelessWidget {
  const DegreeProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => gpaScreen()),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Column(
                children: [
                  Text(
                    'GPA',
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 17, 88, 146),
                    ),
                  ),
                  Text(
                    '3.6',
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 17, 88, 146),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 80,
              ),
              Column(
                children: [
                  ClipOval(
                    child: Container(
                        width: 60,
                        height: 60,
                        color: const Color.fromARGB(255, 207, 207, 207),
                        child: const Icon(Icons.school)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                   Text(
                    'Degree',
                    style: GoogleFonts.rubik(color: Color.fromARGB(190, 138, 138, 138)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                   Text(
                    '20%',
                    style: GoogleFonts.rubik(
                      color: Color.fromARGB(190, 138, 138, 138),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 60,
              ),
              Column(
                children: [
                  ClipOval(
                    child: Container(
                        width: 60,
                        height: 60,
                        color: const Color.fromARGB(255, 207, 207, 207),
                        child: const Icon(Icons.library_books)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                   Text(
                    'Requirements',
                    style: GoogleFonts.rubik(
                      color: const Color.fromARGB(190, 138, 138, 138),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                   Text(
                    '80%',
                    style: GoogleFonts.rubik(
                      color: const Color.fromARGB(190, 138, 138, 138),
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
