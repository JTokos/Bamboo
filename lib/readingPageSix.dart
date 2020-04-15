import 'package:flutter_testing/Passages.dart';
import 'quizSix.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'Passages.dart';

void main() {
  runApp(new MaterialApp(home: new LevelSix()));
}

class LevelSix extends StatefulWidget {
  @override
  LevelSixState createState() => new LevelSixState();
}

class LevelSixState extends State<LevelSix> {
  final timeOutInSeconds = 15;
  final stepInSeconds = 1;
  int currentNumber = 0;

  LevelSixState() {
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
            builder: (context) => Quiz6()), //changes page to question page
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
          title: Text('Level 6\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tTime: $timeRemaining'),
        ),
        body: SingleChildScrollView(
          child:
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child:
                  Text(Passages.LvSixPassage,
                    style: new TextStyle(color: Colors.black, fontSize: 22.0),
                  )
              ),
            ], //children
          ),
        )
    );
  }
}
