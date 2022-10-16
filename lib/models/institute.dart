import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:exampleapplication/models/serializers.dart';

part 'institute.g.dart';

abstract class Institute implements Built<Institute, InstituteBuilder> {
  Institute._();

  factory Institute([void Function(InstituteBuilder) updates]) = _$Institute;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Institute.serializer, this)
        as Map<String, dynamic>;
  }

  static Institute fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Institute.serializer, json)!;
  }

  static Serializer<Institute> get serializer => _$instituteSerializer;

  String get name;

  String get description;

  String get id;

  String get owner;
}
