import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Stack(
        children: [
          SafeArea(
            child: SizedBox(
              height: 200,
              width: 330,
              child: Container(
                height: 178,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(34, 56, 67, 1),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome",
                      style: GoogleFonts.rubik(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      "Haytham Hamdan",
                      style: GoogleFonts.rubik(fontSize: 24, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.school,
                          color: Colors.black,
                        ),
                        Text(
                          "Sophomore",
                          style: GoogleFonts.rubik(fontSize: 12, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Container(height: 170,width: 130,child: Image.asset("lib/images/kfupmBuilding.png")),
          ),
          Positioned(
            right: 125,
            bottom: 160,
            child: ClipOval(
              child:  Container(
                width: 80,
                height: 80,
                child: Image.asset("lib/images/myImage.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
