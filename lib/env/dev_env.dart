import 'package:exampleapplication/env/app_env.dart';

class DevEnvironment extends AppEnvironment {
  DevEnvironment() : super.public();

  @override
  AppEnvType get type => AppEnvType.dev;
}
