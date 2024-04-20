import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //we first set 2 late variables for the stopwatch and timer
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    //we now declare the ontap function with a simple logic, it stops the watch when running or starts it when its tapped while stopped
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    //this function is to display the text from the stopwatch
    var milli = stopwatch.elapsed
        .inMilliseconds; //we first take the elapsed milliseconds, now we'll format them below

    String milliseconds = (milli % 1000).toString().padLeft(3,
        "0"); // we use modulo 1000 to change the miliseconds to 0 after 1 second has elapsed,
    // here the padleft is used to initially have 3 zeros so the app is less glitchy
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2,
        "0"); // we use the same method to change seconds to 0 after 1 minute has passed
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2,
        "0"); // the stopwatch works for 60 hours and shall reset to 0 after that

    return "$minutes:$seconds:$milliseconds";
  }

  @override //we now initiate the stop watch
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    //now we render the app after every 30 miliseconds

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

//this is the interface, UI, we'll try to make it simple yet attractive

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "stp.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Stopwatch App by MQ",
                      style: TextStyle(color: Colors.purple, fontSize: 28),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Click to start/stop",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      handleStartStop();
                    },
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(255, 161, 241,
                              11), //we give a neon color to make it suit the theme of the stopwatch
                          width: 4,
                        ),
                      ),
                      child: Text(
                        returnFormattedText(),
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      // we create a reset button on the bottom and onpressed it'll call the resetfunction declared above
                      stopwatch.reset();
                    },
                    padding: EdgeInsets.all(0),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
