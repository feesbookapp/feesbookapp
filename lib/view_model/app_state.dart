import 'package:exampleapplication/models/user.dart';

class AppState {
  final UserModel? user;
  final Class? classes;
  final Institute? institute;

  AppState({this.user, this.classes, this.institute});

  AppState copyWith({UserModel? user, Class? classes, Institute? institute}) {
    return AppState(
      user: user ?? this.user,
      classes: classes ?? this.classes,
      institute: institute ?? this.institute,
    );
  }
}
