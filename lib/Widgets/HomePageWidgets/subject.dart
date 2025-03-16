import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class subject extends StatelessWidget {
  const subject({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 120,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    // color: Color.fromARGB(61, 205, 247, 156),
                    child: const Icon(
                      Icons.watch_later_outlined,
                      size: 40,
                      //             shadows: [Shadow(offset: Offset(2.0, 2.0),
                      // blurRadius: 3.0,
                      // color: Color.fromARGB(255, 0, 255, 0),)],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                     Text(
                      'Next class',
                      style:
                          GoogleFonts.rubik(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "CHEM-101",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const Spacer(),
                 Column(
                  children: [
                    Text(
                      "10-10:50",
                      style: GoogleFonts.rubik(
                        color: const Color.fromARGB(255, 10, 69, 117),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Text('Building 4',style: GoogleFonts.rubik(color: Colors.grey,),),
                    Text('Room 125',style: GoogleFonts.rubik(color: Colors.grey,),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        left: 18,
        bottom: 18,
        height: 90,
        width: 90,
        child: Image.asset('lib/images/greenEffect.png'),
      ),
    ]);
  }
}
