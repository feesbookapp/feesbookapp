import 'package:exampleapplication/env/app_env.dart';

class ProdEnvironment extends AppEnvironment {
  ProdEnvironment() : super.public();

  @override
  AppEnvType get type => AppEnvType.prod;
}
