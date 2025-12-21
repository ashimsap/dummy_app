import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'weather_service.dart';
import 'weather_model.dart';

final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService();
});

final weatherProvider = FutureProvider.family<Weather, String>((ref, cityName) async {
  final weatherService = ref.watch(weatherServiceProvider);
  return weatherService.getWeather(cityName);
});
