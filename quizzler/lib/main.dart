import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quizzler",
      debugShowCheckedModeBanner: false,
      home: QuizzlerPage(),
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  @override
  _QuizzlerPageState createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  List<Icon> score = [];
  QuizBrain quizBrain = new QuizBrain();

  void checkAnswer(bool userPickedAnswer){
    if(quizBrain.isFinished()==true){

      Alert(
        context: context,
        type: AlertType.success,
        title: "Finished",
        desc: "You\'ve reached the end of the quiz.",
        buttons: [
          DialogButton(
            child: Text(
              "Start Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            width: 120,
            onPressed: () {
              setState(() {
                quizBrain.reset();
                score=[];
              });
              Navigator.pop(context);
            },
          )
        ],
      ).show();
    }
    else {
      bool correctAnswer = quizBrain.getAnswer();
      if (correctAnswer == userPickedAnswer) {
        score.add(Icon(Icons.check, color: Colors.green),);
      } else {
        score.add(Icon(Icons.close, color: Colors.red),);
      }
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                  child: FlatButton(
                    child: Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        checkAnswer(true);
                      });
                    },

                  ),
                )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:0.0, vertical: 10.0),
                  child: FlatButton(
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      )
                    ),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        checkAnswer(false);
                      });
                    },
                  ),
                )
              ),
              Row(
                 children: score
              )
            ],

          ),
        ),
      ),
    );
  }
}
