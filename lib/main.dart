import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.grey[900],
        ),
        body: QuizApp(),
      ),
    ));

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreKeeper = [];

  void changeQuesnum(bool userpicked) {
    bool correctans = quizbrain.getAns();

    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizbrain.reset();
        scoreKeeper = [];
      } else {
        if (userpicked == correctans) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
      quizbrain.nextQues();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Center(
              child: Text(
                quizbrain.getQuestion(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200.0,
          ),
          FlatButton(
            padding: EdgeInsets.all(8.0),
            color: Colors.teal[800],
            child: Text(
              'True',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[200],
              ),
            ),
            onPressed: () {
              changeQuesnum(true);
            },
          ),
          FlatButton(
            padding: EdgeInsets.all(8.0),
            color: Colors.teal[800],
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[200],
              ),
            ),
            onPressed: () {
              changeQuesnum(false);
            },
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ), //Column
    );
  }
}
