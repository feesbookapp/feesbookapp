enum AppEnvType {
  dev,
  prod,
}

abstract class AppEnvironment {
  static AppEnvironment? instance;

  factory AppEnvironment() {
    if (instance == null) {
      throw 'Make Sure Environment Is Created Before Using';
    }
    return instance!;
  }

  AppEnvironment.public() {
    if (instance != null) {
      throw 'Environment Already Created: ${instance!.type}';
    }
    instance = this;
  }

  AppEnvType get type;
}
