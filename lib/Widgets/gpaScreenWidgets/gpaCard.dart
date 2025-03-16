import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GpaCard extends StatelessWidget {
  GpaCard({super.key, required this.sellectedterm, required this.gpa, required this.icon});
  final String sellectedterm;
  final double gpa;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child:  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sellectedterm,
                    style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "$gpa",
                    style: GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
