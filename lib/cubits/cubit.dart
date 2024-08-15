import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitilaThemeState());
  static AppCubit get(context) => BlocProvider.of(context);

/////// this is belong to the bottom navigation bar , for realiable navigate.
  int selectedBNBIndex = 0;
  void onItemTapped(int index) {
    selectedBNBIndex = index;
    emit(
      ChangeTheIndexOfBottomNavBarState(),
    );
  }

//////////////////for language
  String lang = "ar";

  Future<void> changeLang() async {
    final langPrefs = await SharedPreferences.getInstance();
    lang == "en" ? lang = "ar" : lang = "en";
    emit(ChangeLanguageState());
    langPrefs.setString("language", lang == "en" ? "en" : "ar");
  }
  //////////////////////////

  String userName = "طلال أحمد عبداللطيف";

  Future<void> editeName(String newName) async {
    final namepref = await SharedPreferences.getInstance();
    userName = newName;
    emit(EditeNameState());
    namepref.setString("userName", userName);
  }

  /////////////// the yes or no questions cubit ///////////
  // List<int?> selectedAnswers = [];
  // List<int?> initTheSelectedAnswers(length) {
  //   return selectedAnswers = List.filled(length, null);
  // }

  // void selectTheAnswer(questionIndex, answersIndex) {
  //   selectedAnswers[questionIndex] = answersIndex;
  // }

/////////////////////////////////////////////////////////////////////////

  bool areAllQuestionsAnswered(selectedAnswers) {
    emit(CheckAllQustionState());
    return !selectedAnswers.contains(null);
  }

  void selectAnswer({
    required selectedAnswers,
    required questionIndex,
    required answersIndex,
  }) {
    selectedAnswers[questionIndex] = answersIndex;
    emit(SelectAnswerState());
  }

  void checkTheCheckedAnswer({
    required onAnswersChanged,
    required selectedAnswers,
  }) {
    onAnswersChanged?.call(selectedAnswers);
  }

  // bool checkTheCheckedAnswer({
  //   required showConditions,
  //   required answers,
  // }) {
  //   showConditions = answers.isNotEmpty && answers[0] == 0;
  //   emit(SelectAnswerState());
  //   return showConditions;
  // }
}
