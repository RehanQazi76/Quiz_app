import 'package:quizzer/db/questions.dart';

class Quesnbank{
  List<Questions> _qsnbank=[
    Questions("kabul is the capitl of Afganistaan" , true),
    Questions("Is shine the most common bike in India?", true),
    Questions("Bullet gt engine is of 350cc", false),
    Questions(" Honda city has an average of 30km/lit", false),
  ];
  String getqsn(int qsno){
    return _qsnbank[qsno].question;
  }
  bool getans(int qsno)=> _qsnbank[qsno].ans;
}