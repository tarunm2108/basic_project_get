class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  static AppConfig get instance => _instance;

  AppConfig._internal();

  String get baseUrl => String.fromEnvironment('BASE_URL');

  String get apiKey => String.fromEnvironment('API_KEY');
}
