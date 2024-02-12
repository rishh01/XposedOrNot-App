import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final websiteUri = Uri.parse('https://blog.xposedornot.com/what-should-you-do-after-data-breach/');

  Future<void> checkDataBreach(String email) async {
    final apiUrl = Uri.parse('https://api.xposedornot.com/v1/check-email/$email');
    try {
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('Error') && data['Error'] == 'Not found') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Data Breach Alert'),
              content: Text('The email $email has not been involved in any data breaches.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Data Breach Alert'),
              content: Text('The email $email has been involved in a data breach.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          );
        }
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5930EE),
        title: const Center(child: Text("XposedOrNot")),
        titleTextStyle: const TextStyle(
          fontFamily: 'NeometricAltBlack',
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      body: Container(
        color: const Color(0xff181B2D),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Check if Your Email Address is in a Data Breach:',
                style: TextStyle(
                    fontFamily: 'NeometricAltBlack',
                    color: Color(0xff9FC0E0),
                    fontSize: 20),
              ),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: "Enter email to check",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  final email = _textController.text.trim();
                  if (email.isNotEmpty) {
                    checkDataBreach(email);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter an email address'),
                    ));
                  }
                },
                color: Colors.green,
                child: const Text(
                  "Check",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 50),
              Link(
                uri: websiteUri,
                target: LinkTarget.defaultTarget,
                builder: (context, openLink) => TextButton(
                  onPressed: openLink,
                  child: const Text(
                    'Data Breach - Next Steps',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
