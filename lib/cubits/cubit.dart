import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makeny/cubits/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitilaThemeState()) {
    loadLogged();
    loadLang();
    loadFirstTime();
  }
  static AppCubit get(context) => BlocProvider.of(context);

/////// this is belong to the bottom navigation bar , for realiable navigate.
  int selectedBNBIndex = 0;
  void onItemTapped(int index) {
    selectedBNBIndex = index;
    emit(
      ChangeTheIndexOfBottomNavBarState(),
    );
  }
////////////////////share prefrences ////////////////

//// for login users
  String isLoggedIn = "non";

  Future<void> saveLooged(String type) async {
    SharedPreferences loggedIn = await SharedPreferences.getInstance();
    isLoggedIn = (isLoggedIn == type) ? "non" : type;
    loggedIn.setString("loggedIn", isLoggedIn);
    print(".....this is in cubit save ......$isLoggedIn");

    emit(SaveLogInState());
  }

  Future<void> loadLogged() async {
    SharedPreferences loggedIn = await SharedPreferences.getInstance();
    if (loggedIn.containsKey("loggedIn")) {
      isLoggedIn = loggedIn.getString("loggedIn") ?? "non";
      print(".....this is in cubit load ......$isLoggedIn");
      emit(SaveLogInState());
    }
  }

//// for first time app
  bool isFirstLogIn = true;

  Future<void> saveFirstTime() async {
    SharedPreferences firstTimePrefs = await SharedPreferences.getInstance();
    isFirstLogIn = false;
    firstTimePrefs.setBool("isFirstLogIn", isFirstLogIn);
    emit(ChangeLanguageState());
  }

  Future<void> loadFirstTime() async {
    SharedPreferences firstTimePrefs = await SharedPreferences.getInstance();
    bool? firstLog = firstTimePrefs.getBool("isFirstLogIn");
    if (firstLog != null) {
      isFirstLogIn = firstLog;
      emit(ChangeLanguageState());
    }
  }

//////////////////for language
  String lang = "ar";

  Future<void> saveLang() async {
    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    lang == "en" ? lang = "ar" : lang = "en";
    langPrefs.setString("language", lang == "en" ? "en" : "ar");
    emit(ChangeLanguageState());
  }

  Future<void> loadLang() async {
    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    String? language = langPrefs.getString("language");
    if (language != null) {
      lang = language;
      emit(ChangeLanguageState());
    }
  }

  ///

  ///
///////////// save the image from SharedPreferences

  String profileImage = "";

  Future<void> saveImage(
      {required String newImage, required String key}) async {
    SharedPreferences iamgPref = await SharedPreferences.getInstance();
    profileImage = newImage;
    await iamgPref.setString(key, profileImage);
    emit(EditeNameState());
  }

// Load the image from SharedPreferences
  Future<void> loadImage({required String key}) async {
    SharedPreferences iamgPref = await SharedPreferences.getInstance();
    String? image = iamgPref.getString(key);
    if (image != null) {
      profileImage = image;
      emit(ChangeImageState());
    }
  }

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

//////////////////////////////////////////
  bool secure = true;
  bool secure1 = true;
  bool secure2 = true;

  void isSecure() {
    secure = !secure;
    emit(ChangeScureState());
  }

  void isSecure1() {
    secure1 = !secure1;
    emit(ChangeScureState());
  }

  void isSecure2() {
    secure2 = !secure2;
    emit(ChangeScureState());
  }
}
