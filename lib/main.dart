import 'package:flutter/material.dart';
import 'package:quizzer/db/questions.dart';
import 'db/quesnbank.dart';
import 'db/questions.dart';

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
  
  
  Quesnbank q1=Quesnbank();
  int qsno=0;

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
              child: Text(q1.getqsn(qsno),
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
                
                
                setState(() {               

                  bool currans=q1.getans(qsno);
                  if(currans==true)
                  {scores.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ), );
                  }
                  else{
                    scores.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ), );
                  }
                  qsno++;
                   if(qsno>3){
                    qsno=0;
                    print( "length");
                    print( scores.length);
                    scores.clear();
                  }                

                }
                );
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
                
                
                setState(() {
                  if(qsno>3){
                    qsno=0;
                    print( "length");
                    print( scores.length);
                    scores.clear();
                  }
                  
                  bool currans=q1.getans(qsno);
                  if(currans==false)
                  {scores.add(Icon(
                    Icons.check,
                    color: Colors.green,
                  ), );
                  }
                  else{
                    scores.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ), );
                  }
                  qsno++;
                     
                });
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
