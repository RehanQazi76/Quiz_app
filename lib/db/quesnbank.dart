import 'package:quizzer/db/questions.dart';

class Quesnbank{
  int _qsno=0;
  List<Questions> _qsnbank=[
    Questions("kabul is the capitl of Afganistaan" , true),
    Questions("Is shine the most common bike in India?", true),
    Questions("Bullet gt engine is of 350cc", false),
    Questions(" Honda city has an average of 30km/lit", false),
  ];
   void nextQuestion() {
    if (_qsno < _qsnbank.length - 1) {
      _qsno++;
    }
  }

bool isFinished() {
    if (_qsno >= _qsnbank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true 
      // when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset(){
    _qsno=0;
  }

  String getqsn(){
    return _qsnbank[_qsno].question;
  }
  bool getans()=> _qsnbank[_qsno].ans;

}