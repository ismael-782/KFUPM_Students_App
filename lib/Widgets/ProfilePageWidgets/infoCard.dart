import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Card(
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              ),
        color: const Color.fromARGB(255, 255, 255, 255),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 37),
        child: ListTile(
          leading: Icon(
            icon,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          title: Text(
            text,
            style:  GoogleFonts.rubik(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                ),
          ),
        ),
      ),
    );
  }
}