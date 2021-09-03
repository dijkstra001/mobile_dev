import 'package:dev_android/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.lightGreen),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = quizBrain.getQuestionAnswer();
                  if (correctAnswer) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.redAccent,
                    ));
                  }
                  quizBrain.nextQuestionNumber();
                });
                print('Verdadeiro foi pressionado.');
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              child: Text(
                'Falso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(quizBrain.getQuestionAnswer());
                print('Falso foi pressionado.');
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    Icon resultIcon;

    if (!correctAnswer == userPickedAnswer) {
      resultIcon = Icon(Icons.check, color: Colors.greenAccent);
    } else {
      resultIcon = Icon(Icons.close, color: Colors.redAccent);
    }

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
            context: context,
            type: AlertType.warning,
            desc: "Quiz finalizado!",
            buttons: [
              DialogButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  width: 120.0,
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ))
            ]);

        quizBrain.reset();
        scoreKeeper = [];
      }
      quizBrain.nextQuestionNumber();
    });
  }
}
