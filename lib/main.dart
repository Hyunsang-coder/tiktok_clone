import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import 'constants/gaps.dart';

void main() {
  runApp(const TickTokApp());
}

class TickTokApp extends StatelessWidget {
  const TickTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok Clone',
      theme: ThemeData(
        primaryColor: Color(0xffe9435A),
      ),
      home: Padding(
          padding: EdgeInsets.all(Sizes.size32),
          child: Container(
            child: Column(children: [
              Text('Test'),
              Gaps.v3,
              Text('Test2'),
            ]),
          )),
    );
  }
}
