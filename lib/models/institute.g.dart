// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Institute> _$instituteSerializer = new _$InstituteSerializer();

class _$InstituteSerializer implements StructuredSerializer<Institute> {
  @override
  final Iterable<Type> types = const [Institute, _$Institute];
  @override
  final String wireName = 'Institute';

  @override
  Iterable<Object?> serialize(Serializers serializers, Institute object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Institute deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InstituteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Institute extends Institute {
  @override
  final String name;
  @override
  final String description;
  @override
  final String id;
  @override
  final String owner;

  factory _$Institute([void Function(InstituteBuilder)? updates]) =>
      (new InstituteBuilder()..update(updates))._build();

  _$Institute._(
      {required this.name,
      required this.description,
      required this.id,
      required this.owner})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Institute', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'Institute', 'description');
    BuiltValueNullFieldError.checkNotNull(id, r'Institute', 'id');
    BuiltValueNullFieldError.checkNotNull(owner, r'Institute', 'owner');
  }

  @override
  Institute rebuild(void Function(InstituteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InstituteBuilder toBuilder() => new InstituteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Institute &&
        name == other.name &&
        description == other.description &&
        id == other.id &&
        owner == other.owner;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), description.hashCode), id.hashCode),
        owner.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Institute')
          ..add('name', name)
          ..add('description', description)
          ..add('id', id)
          ..add('owner', owner))
        .toString();
  }
}

class InstituteBuilder implements Builder<Institute, InstituteBuilder> {
  _$Institute? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  InstituteBuilder();

  InstituteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _id = $v.id;
      _owner = $v.owner;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Institute other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Institute;
  }

  @override
  void update(void Function(InstituteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Institute build() => _build();

  _$Institute _build() {
    final _$result = _$v ??
        new _$Institute._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'Institute', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'Institute', 'description'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'Institute', 'id'),
            owner: BuiltValueNullFieldError.checkNotNull(
                owner, r'Institute', 'owner'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
