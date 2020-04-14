import 'package:flutter_testing/Passages.dart';
import 'quizFive.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'Passages.dart';

void main() {
  runApp(new MaterialApp(home: new LevelFive()));
}

class LevelFive extends StatefulWidget {
  @override
  LevelFiveState createState() => new LevelFiveState();
}

class LevelFiveState extends State<LevelFive> {
  final timeOutInSeconds = 60;
  final stepInSeconds = 1;
  int currentNumber = 0;

  LevelFiveState() {
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
            builder: (context) => Quiz5()), //changes page to question page
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
          title: Text('Level 5\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTime: $timeRemaining'),
        ),
        body: SingleChildScrollView(
          child:
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:
                Text(Passages.LvFivePassage,
                style: new TextStyle(color: Colors.black, fontSize: 22.0),
                )
              ),
            ], //children
          ),
        )
    );
  }
}
