import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/Calander.dart';
import 'package:flutter_tournament/Screens/HomePage.dart';
import 'package:flutter_tournament/Screens/KfupmCalander.dart';
import 'package:flutter_tournament/Screens/daragatiPage.dart';
import 'package:flutter_tournament/Screens/profilePage.dart';
import 'package:flutter_tournament/Screens/gpaScreen.dart';
import 'package:flutter_tournament/demo2.dart';
import 'package:flutter_tournament/demo3.dart';


class TabsScreen extends StatefulWidget {

  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
    Future<void> _makeRequest(String url, Map<String, String> headers,
      Map<String, dynamic> requestBody) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
      );
    } catch (error) {}
  }

  Future<void> _sendFirstCurlRequest() async {
    const url = 'https://graph.facebook.com/v18.0/{replace this with your own template number}/messages';
    const token =
        '{Replace with WhatsApp API token}'; 

    final Map<String, dynamic> requestBody = {
      "messaging_product": "whatsapp",
      "recipient_type": "individual",
      "to":  "{Phone Number}",
      "type": "template",
      "template": {
        "name": "kfupm_reminder",
        "language": {
          "code": "en",
        },
        "components": [
          {
            "type": "body",
            "parameters": [
              {"type": "text", "text": "Mohamed"},
              {"type": "text", "text": "Math101 Homework"},
              {"type": "text", "text": "Saturday"},
            ],
          }
        ]
      }
    };

    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    await _makeRequest(url, headers, requestBody);
  }

  @override
  Widget build(BuildContext context) {
    Widget _activePage = HomePage();
    if (_selectedPageIndex == 1) {
      _activePage = const DarajatiPage();
    }
    if (_selectedPageIndex == 2) {
      _sendFirstCurlRequest();
      _activePage = const MyCalenderScreen();
    }
    if (_selectedPageIndex == 3) {
      _activePage = const ProfilePage();
    }
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 251, 1),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          selectedFontSize: 0,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          iconSize: 35,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.school_outlined,
              ),
              label: "Darajati",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "CC",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "profile",
            ),
          ],
        ),
        body: _activePage);
  }
}
