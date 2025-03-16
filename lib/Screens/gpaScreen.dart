import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tournament/Widgets/gpaScreenWidgets/gpaCard.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<String, double> termMap = {
  "Term211": 3.75,
  "Term212": 3.60,
  "Term213": 3.40,
  "Term221": 3.75,
  "Term222": 3.60,
  "Term223": 3.40,
  "Term231": 3.75,
  "Term232": 3.60,
  "Term241": 3.40
};

class gpaScreen extends StatefulWidget {
  const gpaScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _gpaScreen();
  }
}

class _gpaScreen extends State<gpaScreen> {
  String _selectedTerm = termMap.keys.toList()[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 251, 1),
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title:  Text(
          'GPA Page',
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
        child: Column(
          children: [
            GpaCard(
              sellectedterm: 'Total GPA',
              gpa: 3.75,
              icon: Icon(
                Icons.format_line_spacing_outlined,
                size: 40,
              ),
            ),
            SizedBox(
              height: 7,
            ),
             Text(
              "Select a term to see its GPA",
              style: GoogleFonts.rubik(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
           const SizedBox(
              height: 7,
            ),
            GpaCard(
              sellectedterm: _selectedTerm,
              gpa: termMap[_selectedTerm]!,
              icon: const Icon(
                Icons.text_rotation_angleup_sharp,
                size: 40,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Expanded(
              child: Container(
                height: 360,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(183, 183, 185, 1),
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListView.builder(
                  itemCount: termMap.length,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTerm = termMap.keys.toList()[index];
                          });
                        },
                        child: Card(
                          color: _selectedTerm == termMap.keys.toList()[index]
                              ? const Color.fromRGBO(77, 125, 148, 0.847)
                              : null,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                              child: Text(
                            termMap.keys.toList()[index],
                            style: GoogleFonts.rubik(
                              fontSize: 26,
                            ),
                          )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
