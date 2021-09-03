import 'package:dev_android/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(text: 'Alguns gatos são alérgicos a humanos', answer: true),
    Question(
        text:
            'É possível fazer com que uma vaca suba escadas, mas não descê-las.',
        answer: true),
    Question(
        text: 'Aproximadamente um quarto dos ossos humanos estão nos pés.',
        answer: true),
    Question(text: 'O sangue de uma lesma é verde.', answer: false),
    Question(
        text: 'O nome de solteira da mãe de Buzz Aldrin era \"Moon\".',
        answer: false),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].text;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  void nextQuestionNumber() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber == _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
