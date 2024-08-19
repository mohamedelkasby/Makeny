import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  static NotificationCubit get(context) => BlocProvider.of(context);

  bool notificationClicked(value) {
    value = false;
    emit(
      NotificationClickedState(),
    );
    // print(value);
    return value;
  }
}
