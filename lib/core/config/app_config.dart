enum DataSourceType { mock, local, remote }

class AppConfig {
  AppConfig._();

  // mock = titres de démo, local = musique du téléphone, remote = API .NET
  static const DataSourceType trackSource = DataSourceType.local;
  static const bool useMockFavorites = true;

  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://10.0.2.2:5000',
  );
}
