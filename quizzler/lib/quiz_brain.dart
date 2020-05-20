import 'question.dart';

class QuizBrain{
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question("Sun is bigger than the moon",true),
    Question("Moon is bigger than the Earth",false),
  ];

  bool getAnswer(){
    return _questionBank[_questionNumber].answer;
  }

  String getQuestion(){
    return _questionBank[_questionNumber].questionText;
  }

  int totalQuestion(){
    return _questionBank.length;
  }

  void nextQuestion(){
    if(_questionNumber<this.totalQuestion()-1){
      _questionNumber++;
    }
  }
  bool isFinished() {
    if (_questionNumber >= _questionBank.length-1) {
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}