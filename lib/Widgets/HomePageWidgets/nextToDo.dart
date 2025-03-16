import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/Calander.dart';
import 'package:flutter_tournament/Screens/Calander2.dart';
import 'package:google_fonts/google_fonts.dart';

class nextToDo extends StatelessWidget {
  const nextToDo({super.key});

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
    const token = '{Replace with WhatsApp API token}'; 
    
    final Map<String, dynamic> requestBody = {
      "messaging_product": "whatsapp",
      "recipient_type": "individual",
      "to": "{Phone Number}",
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
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        _sendFirstCurlRequest();

        return MyCalenderScreen2();
      })),
      child: Stack(children: [
        Container(
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      // color: const Color.fromARGB(31, 247, 168, 156),
                      child: const Icon(
                        Icons.move_to_inbox,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ICS-104 Quiz',
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "In 3 days",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
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
          child: Image.asset('lib/images/redEffect.png'),
        ),
      ]),
    );
  }
}
