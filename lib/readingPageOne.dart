import 'package:flutter_testing/Passages.dart';
import 'quizOne.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'Passages.dart';

void main() {
  runApp(new MaterialApp(home: new LevelOne()));
}

class LevelOne extends StatefulWidget {
  @override
  LevelOneState createState() => new LevelOneState();
}

class LevelOneState extends State<LevelOne> {
  final timeOutInSeconds = 60;
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
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Level 1\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTime: $timeRemaining'),
        ),
        body: SingleChildScrollView(
          child:
          Column(
            children: <Widget>[
              Text(
                Passages.LvOnePassage,
                style: new TextStyle(color: Colors.black, fontSize: 22.0),
              ),
            ], //children
          ),
        )
    );
  }
}
