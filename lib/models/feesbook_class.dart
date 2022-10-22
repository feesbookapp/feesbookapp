import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:exampleapplication/models/serializers.dart';

part 'feesbook_class.g.dart';

abstract class FeesbookClass
    implements Built<FeesbookClass, FeesbookClassBuilder> {
  FeesbookClass._();

  factory FeesbookClass([void Function(FeesbookClassBuilder) updates]) =
      _$FeesbookClass;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(FeesbookClass.serializer, this)
        as Map<String, dynamic>;
  }

  static FeesbookClass fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(FeesbookClass.serializer, json)!;
  }

  static Serializer<FeesbookClass> get serializer => _$feesbookClassSerializer;

  String get institute;

  String get name;
}
