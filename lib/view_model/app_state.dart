import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:exampleapplication/models/feesbook_class.dart';
import 'package:exampleapplication/models/institute.dart';
import 'package:exampleapplication/models/serializers.dart';
import 'package:exampleapplication/models/user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppState.serializer, this)
        as Map<String, dynamic>;
  }

  static AppState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppState.serializer, json)!;
  }

  static Serializer<AppState> get serializer => _$appStateSerializer;

  UserModel? get user;

  BuiltList<FeesbookClass>? get classes;

  Institute? get institute;
}
