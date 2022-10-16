import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:exampleapplication/models/serializers.dart';

part 'user.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  UserModel._();

  factory UserModel([void Function(UserModelBuilder) updates]) = _$UserModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserModel.serializer, this)
        as Map<String, dynamic>;
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserModel.serializer, json)!;
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;

  String get id;

  String get phone;

  String get name;

  String get profilePicture;

  DateTime get updatedAt;

  DateTime get createdAt;
}
