import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'db/quesnbank.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scores=[  ];
  int qsno=0;
    Quesnbank q1=Quesnbank();
  void checkanswer(bool userans ){
    bool currans=q1.getans();
    setState(() {
      
      if(q1.isFinished()==true){
        Alert(context: context,
         title: "Quiz ended", 
         desc: "take the quiz again",
         buttons: [
          DialogButton(child: Text("Retake",
          style: TextStyle(color: Colors.white),),
          color: Colors.green,
           onPressed: (){})
         ]
         ).show();

        q1.reset();
        scores=[];
      }
      
      else{
        
        if(currans== userans){
         scores.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                 );
         }
       else{
            scores.add(const Icon(
            Icons.close,
            color: Colors.red,
              ), 
            );
          }
          q1.nextQuestion();
          }
    });
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(q1.getqsn(),
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
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkanswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkanswer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scores,
        )
      ],
    );
  }
}
