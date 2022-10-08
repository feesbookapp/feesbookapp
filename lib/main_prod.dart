import 'package:exampleapplication/env/prod_env.dart';

import 'app.dart' as app;

void main() {
  app.main(environment: ProdEnvironment());
}
