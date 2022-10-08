import 'package:exampleapplication/view_model/app_state.dart';
import 'package:exampleapplication/view_model/app_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateViewModelProvider =
    StateNotifierProvider<AppStateViewModel, AppState>((_) {
  return AppStateViewModel(AppState());
});
