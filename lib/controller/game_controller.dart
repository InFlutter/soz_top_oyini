import 'package:get/get.dart';
import 'package:guess_the_word_game/model/question.dart';

class GameController extends GetxController {
  var questions = <Question>[];
  RxInt currentQuestionIndex = 0.obs;
  RxString userAnswer = ''.obs;
  RxInt correctAnswersCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadQuestions();
  }

  void _loadQuestions() {
    questions.addAll([
      Question(
        questionText: 'Flutterda mobil ilovalar qanday til yordamida yoziladi?',
        letters: ['D', 'A', 'R', 'T'],
        shuffledLetters: _shuffle(['D', 'A', 'R', 'T']),
        correctAnswer: 'DART',
      ),
      Question(
        questionText: 'Flutter kim tomonidan ishlab chiqilgan?',
        letters: ['G', 'O', 'O', 'G', 'L', 'E'],
        shuffledLetters: _shuffle(['G', 'O', 'O', 'G', 'L', 'E']),
        correctAnswer: 'GOOGLE',
      ),
      Question(
        questionText: 'Flutterda foydalanuvchi interfeysi nima deb ataladi?',
        letters: ['W', 'I', 'D', 'G', 'E', 'T'],
        shuffledLetters: _shuffle(['W', 'I', 'D', 'G', 'E', 'T']),
        correctAnswer: 'WIDGET',
      ),
      Question(
        questionText: 'Flutterda davlatni boshqarish uchun qaysi arxitektura keng qo\'llaniladi?',
        letters: ['B', 'L', 'O', 'C'],
        shuffledLetters: _shuffle(['B', 'L', 'O', 'C']),
        correctAnswer: 'BLOC',
      ),
      Question(
        questionText: 'Flutterda ma\'lumotlarni saqlash uchun qaysi xizmat keng qo\'llaniladi?',
        letters: ['F', 'I', 'R', 'E', 'B', 'A', 'S', 'E'],
        shuffledLetters: _shuffle(['F', 'I', 'R', 'E', 'B', 'A', 'S', 'E']),
        correctAnswer: 'FIREBASE',
      ),
      Question(
        questionText: 'Flutterda ilovalarni test qilish uchun qaysi vosita keng qo\'llaniladi?',
        letters: ['F', 'L', 'U', 'T', 'T', 'E', 'R'],
        shuffledLetters: _shuffle(['F', 'L', 'U', 'T', 'T', 'E', 'R']),
        correctAnswer: 'FLUTTER',
      ),
      Question(
        questionText: 'Flutter SDK nima?',
        letters: ['S', 'O', 'F', 'T', 'W', 'A', 'R', 'E'],
        shuffledLetters: _shuffle(['S', 'O', 'F', 'T', 'W', 'A', 'R', 'E']),
        correctAnswer: 'SOFTWARE',
      ),
      Question(
        questionText: 'Flutterda UI yaratishda eng ko\'p ishlatiladigan komponentlar qanday ataladi?',
        letters: ['C', 'O', 'M', 'P', 'O', 'N', 'E', 'N', 'T'],
        shuffledLetters: _shuffle(['C', 'O', 'M', 'P', 'O', 'N', 'E', 'N', 'T']),
        correctAnswer: 'COMPONENT',
      ),
      Question(
        questionText: 'Flutterda animatsiyalarni yaratish uchun qaysi paket ishlatiladi?',
        letters: ['A', 'N', 'I', 'M', 'A', 'T', 'I', 'O', 'N'],
        shuffledLetters: _shuffle(['A', 'N', 'I', 'M', 'A', 'T', 'I', 'O', 'N']),
        correctAnswer: 'ANIMATION',
      ),
      Question(
        questionText: 'Flutter ilovalari qanday platformalarda ishlaydi?',
        letters: ['A', 'N', 'D', 'R', 'O', 'I', 'D', 'I', 'O', 'S'],
        shuffledLetters: _shuffle(['A', 'N', 'D', 'R', 'O', 'I', 'D', 'I', 'O', 'S']),
        correctAnswer: 'ANDROIDIOS',
      ),
    ]);
  }

  List<String> _shuffle(List<String> list) {
    list.shuffle();
    return list;
  }

  void checkAnswer() {
    final currentQuestion = questions[currentQuestionIndex.value];
    if (userAnswer.value.toUpperCase() == currentQuestion.correctAnswer) {
      correctAnswersCount.value++;
      Get.defaultDialog(
        title: 'To\'g\'ri!',
        middleText: 'Siz to\'g\'ri topdingiz!',
        onConfirm: () {
          _nextQuestion();
          Get.back();
        },
      );
    } else {
      Get.defaultDialog(
        title: 'Noto\'g\'ri!',
        onConfirm: () {
          _nextQuestion();
          Get.back();
        },
      );
    }
  }

  void _nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      userAnswer.value = '';
    } else {
      Get.defaultDialog(
        title: 'O\'yin tugadi!',
        middleText: 'Siz ${correctAnswersCount.value} ta savoldan ${questions.length} tasini to\'g\'ri topdingiz.',
        onConfirm: () => Get.back(),
      );
    }
  }

  void updateUserAnswer(String letter) {
    if (userAnswer.value.length <
        questions[currentQuestionIndex.value].correctAnswer.length) {
      userAnswer.value += letter;
    }
  }
}
