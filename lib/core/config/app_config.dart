class AppConfig {
  AppConfig._();

  // false quand l'API sera prête
  static const bool useMockTracks = true;

  // 10.0.2.2 = localhost du PC depuis l'émulateur Android
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://10.0.2.2:5000',
  );
}
