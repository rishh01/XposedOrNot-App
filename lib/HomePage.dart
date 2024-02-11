import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    );
  }
}
