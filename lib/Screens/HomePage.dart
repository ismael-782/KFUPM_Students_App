
import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/Calander.dart';
import 'package:flutter_tournament/Screens/KfupmCalander.dart';
import 'package:flutter_tournament/Screens/map.dart';
import 'package:flutter_tournament/Widgets/HomePageWidgets/customButton.dart';
import 'package:flutter_tournament/Widgets/HomePageWidgets/nextToDo.dart';
import 'package:flutter_tournament/Widgets/HomePageWidgets/profileInfo.dart';
import 'package:flutter_tournament/Widgets/HomePageWidgets/subject.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  
    

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileInfo(),
        SizedBox(
          height: 35,
        ),
        subject(),
        SizedBox(
          height: 35,
        ),
        nextToDo(),
        SizedBox(
          height: 35,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                },
                child: const customButton(
                  buttonName: 'Attendece',
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 29,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                child: const customButton(
                  buttonName: 'Calender',
                  icon: Icon(
                    Icons.calendar_today,
                    size: 29,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const CalanderScreen(),
                    ),
                  );
                },
              ),
             const SizedBox(
                width: 10,
              ),
              InkWell(
                child: const customButton(
                  buttonName: 'Map',
                  icon: Icon(
                    Icons.map,
                    size: 29,
                  ),
                ),
                onTap: (){
                  Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const MapScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
