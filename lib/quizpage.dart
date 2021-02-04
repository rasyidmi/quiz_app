//Quiz page

import 'package:flutter/material.dart';
import 'main.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain questionBank = QuizBrain();
  //Containing icon, "Correct or False".
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  int correctAnswer = 0;

  //Alert pop-up styling.
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.blue,
    ),
    alertAlignment: Alignment.center,
  );

  void checkAnswer(bool answer) {
    setState(() {
      if (questionBank.getAnswer(questionNumber) == answer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        correctAnswer++;
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      //If current question number is the last question, finish the quiz.
      if (questionNumber == questionBank.getLength() - 1) {
        questionNumber = 0;
        int score = (correctAnswer * 100 / questionBank.getLength()).round();
        correctAnswer = 0;
        Alert(
          context: context,
          style: alertStyle,
          title: "Well Done!",
          desc: "Your score is $score",
          buttons: [
            DialogButton(
              child: Text(
                "back to main menu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                );
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        questionNumber++;
        print('Number $questionNumber');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questionBank.getQuestion(questionNumber),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
