import 'package:flutter/material.dart';

class BangladesTimePage extends StatefulWidget {
  const BangladesTimePage({super.key});

  @override
  State<BangladesTimePage> createState() => _BangladesTimePageState();
}

class _BangladesTimePageState extends State<BangladesTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(child: Container(color: Colors.pinkAccent,)),
            Expanded(child: Container(color: Colors.green,)),
          ],
        ),
      ),
    );
  }
}
