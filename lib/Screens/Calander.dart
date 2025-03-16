import 'package:flutter/material.dart';
import 'package:flutter_tournament/Models/Task.dart';
import 'package:flutter_tournament/Providers/TasksProvider.dart';
import 'package:flutter_tournament/Widgets/CalanderWidgets/bottomsheet.dart';
import 'package:flutter_tournament/Widgets/CalanderWidgets/taskCard.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCalenderScreen extends ConsumerStatefulWidget {
  const MyCalenderScreen({super.key});

  @override
  ConsumerState<MyCalenderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = ref.watch(fDutiesProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Eventify',
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
      body: SingleChildScrollView(
        child: Column(children: [
          ...tasks.map((e) => TaskCard(taskName: e.title,taskDate: e.date,)).toList(),
        ]),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 70.0,
            height: 70.0,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context,
                  builder: (context) => MyBottomSheet(),
                );
              },
              backgroundColor: Color.fromRGBO(34, 56, 67, 1),
              elevation: 5.0,
              heroTag: null,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
