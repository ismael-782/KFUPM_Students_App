import 'package:flutter/material.dart';
import 'package:flutter_tournament/data/calanderData.dart';


class CalanderScreen extends StatelessWidget {
  const CalanderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Academic Calendar 23/24',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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
      body: ListView.builder(
        itemCount: calanderInfo.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              calanderInfo[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              calanderInfo[index].date,
                              style:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text("Week ${calanderInfo[index].week}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 10, 69, 117),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              calanderInfo[index].day,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 82, 82, 82),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          );
        },
      )
    );
  }
}