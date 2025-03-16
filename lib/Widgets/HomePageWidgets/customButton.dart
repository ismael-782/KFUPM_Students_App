import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customButton extends StatelessWidget {
  const customButton({
    super.key,
    required this.buttonName,
    required this.icon,
  });

  final String buttonName;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: 120,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 53.14,
            height: 53.14,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 251, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  icon,
          ),
          const SizedBox(height: 15,),
          Text(
            buttonName,
            style: GoogleFonts.rubik(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
