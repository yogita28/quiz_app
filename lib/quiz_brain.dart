import 'question.dart';

class Quizbrain {
  int _quesnum = 0;

  List<Question> _qBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(
        q: 'Approximately one quater of human bonesare in the feet', a: true),
    Question(q: 'A slug\'s bloood is green', a: true)
  ];

  void nextQues() {
    if (_quesnum < _qBank.length - 1) {
      _quesnum++;
    }
  }

  String getQuestion() {
    return _qBank[_quesnum].questi;
  }

  bool getAns() {
    return _qBank[_quesnum].ans;
  }

  bool isFinished() {
    if (_quesnum >= _qBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesnum = 0;
  }
}
