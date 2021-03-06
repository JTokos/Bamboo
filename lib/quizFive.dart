import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReadingQuiz {
  var questions = [
    "To what country does Twain say the witty story belongs?",
    "To what country does Twain say the humorous belongs?",
    "Is Twain talking about stories told out loud, printed stories, or both or neither?",
  ];

  var choices = [
    ["Italy", "Germany", "England", "France"],
    ["America", "France", "Italy", "Germany"],
    ["Stories told out loud", "Printed stories", "Both", "Neither"],
  ];

  var correctAnswers = ["France", "America", "Stories told out loud"];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new ReadingQuiz();

class Quiz5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz5State();
  }
}

class Quiz5State extends State<Quiz5> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Level 5 Quiz'),
            ),
            body: new Container(
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.topCenter,
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.centerRight,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            "Question ${questionNumber + 1} of ${quiz.questions.length}",
                            style: new TextStyle(fontSize: 22.0),
                          ),
                          new Text(
                            "Score: $finalScore",
                            style: new TextStyle(fontSize: 22.0),
                          ),
                        ],
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(20.0)),
                    new Text(
                      quiz.questions[questionNumber],
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button1
                        new MaterialButton(
                          minWidth: 300.0,
                          color: Colors.green,
                          onPressed: () {
                            if (quiz.choices[questionNumber][0] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Incorrect");
                            }
                            updateQuestion();
                          },
                          child: new Text(
                            quiz.choices[questionNumber][0],
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                        //button2
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    //Button 2
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new MaterialButton(
                          minWidth: 300.0,
                          color: Colors.green,
                          onPressed: () {
                            if (quiz.choices[questionNumber][1] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Incorrect");
                            }
                            updateQuestion();
                          },
                          child: new Text(
                            quiz.choices[questionNumber][1],
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button3
                        new MaterialButton(
                          minWidth: 300.0,
                          color: Colors.green,
                          onPressed: () {
                            if (quiz.choices[questionNumber][2] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Incorrect");
                            }
                            updateQuestion();
                          },
                          child: new Text(
                            quiz.choices[questionNumber][2],
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //button4
                        new MaterialButton(
                          minWidth: 300.0,
                          color: Colors.green,
                          onPressed: () {
                            if (quiz.choices[questionNumber][3] ==
                                quiz.correctAnswers[questionNumber]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Incorrect");
                            }
                            updateQuestion();
                          },
                          child: new Text(
                            quiz.choices[questionNumber][3],
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(25.0),
                    ),

                    //Quit Button
                    new Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: new MaterialButton(
                        color: Colors.red,
                        minWidth: 240.0,
                        height: 40.0,
                        onPressed: quit,
                        child: new Text(
                          "Quit",
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))));
  }

  void quit() {
    //goes back to main menu and resets score
    setState(() {
      Navigator.popUntil(context, ModalRoute.withName("/"));
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      //disables back button, NO CHEATING ON QUIZ!
        onWillPop: () async => false,
        child: Scaffold(
          body: new Container(
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Final Score: $score",
                  style: new TextStyle(fontSize: 25.0),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      questionNumber = 0;
                      finalScore = 0;
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: new Text(
                      "Main Menu",
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ))
              ],
            ),
          ),
        ));
  }
}
