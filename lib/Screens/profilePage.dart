import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/logIn.dart';
import 'package:flutter_tournament/Widgets/ProfilePageWidgets/customProfileInfoWidget.dart';
import 'package:flutter_tournament/Widgets/ProfilePageWidgets/infoCard.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/HomePageWidgets/profileInfo.dart';

// our data
// ignore: constant_identifier_names
const Standing = "Sophomore";
const phone = "+966 53 182 013";
const id = "202182690"; // not real number :)
const major = "Softwar Engineering";
const email = "s202165890@kfupm.edu.sa";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: <Widget>[
              const CustomProfileInfo(),
              const Divider(
                height: 30.0,
                thickness: 2.0,
                color: Color.fromARGB(255, 143, 143, 143),
                indent: 30.0,
                endIndent: 30.0,
              ),
              const SizedBox(
                height: 10,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd
              InfoCard(
                  text: id, icon: Icons.badge_outlined, onPressed: () async {}),
              const SizedBox(
                height: 5,
                width: 200,
              ),
              InfoCard(
                  text: Standing,
                  icon: Icons.collections_bookmark_rounded,
                  onPressed: () async {}),
              const SizedBox(
                height: 5,
                width: 200,
              ),
              InfoCard(text: major, icon: Icons.school, onPressed: () async {}),
              const SizedBox(
                height: 5,
                width: 200,
              ),
              InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),
              const SizedBox(
                height: 5,
                width: 200,
              ),
              InfoCard(text: email, icon: Icons.mail, onPressed: () async {}),
              const SizedBox(
                height: 5,
                width: 200,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (cyx) => const LogInPage(),
                    ),
                  );
                },
                label:  Text(
                  'Log Out',
                  style: GoogleFonts.rubik(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
                  backgroundColor: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                icon: const Icon(
                  Icons.logout,
                ),
              ),
            ],
          ),
        ));
  }
}
