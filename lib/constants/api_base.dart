

class ApiConstants {
  // Base URLs
  static const String baseUrlWeather = 'https://api.openweathermap.org/data/2.5/';
  static const String baseUrlCricket = 'https://api.cricket.com/v1/';
  static const String baseUrlFootball = 'https://api.football.com/v1/';

  // Weather API Endpoints
  static const String weatherCurrent = '${baseUrlWeather}weather';
  static const String weatherForecast = '${baseUrlWeather}forecast';

  // Cricket API Endpoints
  static const String cricketMatches = '${baseUrlCricket}matches';
  static const String cricketScores = '${baseUrlCricket}scores';

  // Football API Endpoints
  static const String footballFixtures = '${baseUrlFootball}fixtures';
  static const String footballStandings = '${baseUrlFootball}standings';
}
