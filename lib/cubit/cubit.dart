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

///////// this is belong to the notification /////////////

  bool notificationClicked(value) {
    value = false;
    emit(
      NotificationClickedState(),
    );
    // print(value);
    return value;
  }
  //////////////////////////

  String userName = "طلال أحمد عبداللطيف";

  /////////////// the yes or no questions cubit ///////////
  List<int?> selectedAnswers = [];
  List<int?> initTheSelectedAnswers(length) {
    return selectedAnswers = List.filled(length, null);
  }

  void selectTheAnswer(questionIndex, answersIndex) {
    selectedAnswers[questionIndex] = answersIndex;
  }
}
