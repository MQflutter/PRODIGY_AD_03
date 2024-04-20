import 'package:flutter/material.dart';

import 'package:stopwatch_app/pages/homescreen.dart';

void main() {
  runApp(MyApp());
}

//the homescreen widget will be stateful, but the app as a whole will be stateless, so stateless widget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this removes the red colored debug banner on top of the app
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
