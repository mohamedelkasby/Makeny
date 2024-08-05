import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubit/status.dart';

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

/////
  bool newNotification = true;

  bool notificationClicked(clicked) {
    newNotification = !newNotification;
    emit(
      NotificationClickedState(),
    );
    return newNotification;
  }
/////////////// the yes or no questions cubit ///////////

  /// define
  List<List<bool>> YorNQuestions = [];
  List<List<bool>> allQuestionAnswers = [];

///// initializ the answers to be all not answer when enter the page.

  void initializeQuestions(int numberOfQuestions) {
    YorNQuestions = List.generate(
      numberOfQuestions,
      (_) => [false, false],
    );
    emit(AppQuestionInitialized());
  }

  void yesOrNoClicked({
    required int questionIndex,
    required int answerIndex,
  }) {
    print(
        "yesOrNoClicked: questionIndex= $questionIndex, answerIndex=$answerIndex");

    YorNQuestions[questionIndex] = [false, false];
    YorNQuestions[questionIndex][answerIndex] = true;
    emit(AppAnswerSelected());
  }

  bool allQuestionsAnswered() {
    return allQuestionAnswers.every(
      (question) => true,
    );
  }
}
