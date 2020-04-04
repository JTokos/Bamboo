import 'main.dart';
import 'questionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/main.dart';
import 'package:quiver/async.dart';
import 'dart:math';


String para = prompt();
void main() {
  runApp(new MaterialApp(home: new LevelOne()));
}
// ignore: missing_return
String prompt() {
  Random rnd = new Random();
  int min = 1;
  int max = 4;
  int randNum = min + rnd.nextInt(max - min);
  switch (randNum) {
    case 1:
      {
        return("Excellent");
      }
      break;

    case 2:
      {
        return("Good");
      }
      break;

    case 3:
      {
        return("Fair");
      }
      break;

    default:
      {
        print("Invalid choice");
      }
      break;
  }
}

class LevelOne extends StatefulWidget {
  @override
  LevelOneState createState() => new LevelOneState();
}

class LevelOneState extends State<LevelOne> {
  final timeOutInSeconds = 5;
  final stepInSeconds = 1;
  int currentNumber = 0;

  LevelOneState() {
    setupCountdownTimer();
  }

  setupCountdownTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
        new Duration(seconds: timeOutInSeconds),
        new Duration(seconds: stepInSeconds));

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      currentNumber += stepInSeconds;

      this.onTimerTick(currentNumber);
      print('Remaining time:  $currentNumber');
    });

    sub.onDone(() {
      print("I'm done");

      sub.cancel();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Quiz1()), //changes page to question page
      );
    });
  }

  void onTimerTick(int currentNumber) {
    setState(() {
      currentNumber = currentNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    int timeRemaining = timeOutInSeconds - currentNumber;
    // Make it start from the timeout value
    //number += stepInSeconds
    return new Scaffold(
        appBar: AppBar(
          title: Text('Level 1'),
        ),
        body: new Center(
          child:
          Column(
            children: <Widget>[
              Text(
                "Paragraph: $para",
                style: new TextStyle(color: Colors.green, fontSize: 25.0),
              ),
              Text(
                "Time Remaining: $timeRemaining",
              ),
            ], //children
          ),
        )
    );
  }
}
