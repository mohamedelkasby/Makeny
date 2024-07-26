import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubit/status.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitilaThemeState());
  static AppCubit get(context) => BlocProvider.of(context);

/////// this is belong to the bottom navigation bar , for realiable navigate.
  int selectedBNBIndex = 0;
  void onItemTapped(int index) {
    selectedBNBIndex = index;
    emit(ChangeTheIndexOfBottomNavBarState());
  }

/////
  bool newNotification = true;

  bool notificationClicked(clicked) {
    newNotification = !newNotification;
    emit(NotificationClickedState());
    return newNotification;
  }
}
