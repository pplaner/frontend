const String apiUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:8080',
);

const String environmentName = String.fromEnvironment(
  'ENV_NAME',
  defaultValue: 'development',
);
