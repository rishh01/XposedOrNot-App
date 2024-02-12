import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textcontroller = TextEditingController();
  final websiteUri = Uri.parse(
      'https://blog.xposedornot.com/what-should-you-do-after-data-breach/');
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textcontroller,
              decoration: const InputDecoration(
                hintText: "Enter email to check",
                border: OutlineInputBorder(),
              ),
            ),
            MaterialButton(
              onPressed: () {},
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
    );
  }
}
