import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:exampleapplication/models/feesbook_class.dart';
import 'package:exampleapplication/models/institute.dart';
import 'package:exampleapplication/models/user.dart';
import 'package:exampleapplication/view_model/app_state.dart';

part 'serializers.g.dart';

@SerializersFor([
  UserModel,
  FeesbookClass,
  Institute,
  AppState,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
