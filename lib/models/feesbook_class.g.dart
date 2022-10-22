// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feesbook_class.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeesbookClass> _$feesbookClassSerializer =
    new _$FeesbookClassSerializer();

class _$FeesbookClassSerializer implements StructuredSerializer<FeesbookClass> {
  @override
  final Iterable<Type> types = const [FeesbookClass, _$FeesbookClass];
  @override
  final String wireName = 'FeesbookClass';

  @override
  Iterable<Object?> serialize(Serializers serializers, FeesbookClass object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'institute',
      serializers.serialize(object.institute,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FeesbookClass deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeesbookClassBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'institute':
          result.institute = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$FeesbookClass extends FeesbookClass {
  @override
  final String institute;
  @override
  final String name;

  factory _$FeesbookClass([void Function(FeesbookClassBuilder)? updates]) =>
      (new FeesbookClassBuilder()..update(updates))._build();

  _$FeesbookClass._({required this.institute, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        institute, r'FeesbookClass', 'institute');
    BuiltValueNullFieldError.checkNotNull(name, r'FeesbookClass', 'name');
  }

  @override
  FeesbookClass rebuild(void Function(FeesbookClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeesbookClassBuilder toBuilder() => new FeesbookClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeesbookClass &&
        institute == other.institute &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, institute.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeesbookClass')
          ..add('institute', institute)
          ..add('name', name))
        .toString();
  }
}

class FeesbookClassBuilder
    implements Builder<FeesbookClass, FeesbookClassBuilder> {
  _$FeesbookClass? _$v;

  String? _institute;
  String? get institute => _$this._institute;
  set institute(String? institute) => _$this._institute = institute;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FeesbookClassBuilder();

  FeesbookClassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _institute = $v.institute;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeesbookClass other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeesbookClass;
  }

  @override
  void update(void Function(FeesbookClassBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeesbookClass build() => _build();

  _$FeesbookClass _build() {
    final _$result = _$v ??
        new _$FeesbookClass._(
            institute: BuiltValueNullFieldError.checkNotNull(
                institute, r'FeesbookClass', 'institute'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'FeesbookClass', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
