//class that contains all of the questions and answers.
import 'question.dart';

class QuizBrain {
  // int _questionNumber = 0;

  List<Question> _questions = [
    Question('What language does Flutter use?', 1,
        ['Java', 'Dart', 'Python', 'C++']),
    Question('Which country has the highest population?', 0,
        ['China', 'India', 'USA', 'Indonesia']),
    Question('When was Google founded?', 0, ['1998', '2000', '1990', '1995']),
    Question('What is the largest animal in the world?', 2,
        ['Elephant', 'White Shark', 'Blue Whale', 'Heavy Blue Whale']),
    Question('How many planets in the solar system?', 0, ['8', '9', '7', '10']),
    Question('100/0?', 2, ['0', '100', 'NaN', '1']),
    Question('The capital of Indonesia?', 1,
        ['Bandung', 'Jakarta', 'Padang', 'Yogyakarta']),
    Question('The first university in Indonesia?', 2, [
      'Institut Teknologi Bandung',
      'University of Jakarta',
      'Universitas Indonesia',
      'Kampus Indonesia'
    ]),
    Question('Indonesia\' birthday?', 3, [
      '17 Agustus 1946',
      '18 Agustus 1945',
      '17 Agusutus 1945',
      '17 Agustus 1945'
    ]),
    Question('My favourite character?', 2,
        ['Luffy', 'Nam Do-san', 'Roronoa Zoro', 'Eren']),
  ];

  String getQuestion(int number) {
    return _questions[number].question;
  }

  int getAnswer(int number) {
    return _questions[number].answerIndex;
  }

  String getAnswers(int questionNumber, int answerNumber) {
    return _questions[questionNumber].answers[answerNumber];
  }

  int getLength() {
    return _questions.length;
  }
}
