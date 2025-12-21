import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_model.dart';

class JokeService {
  final String baseUrl = 'https://official-joke-api.appspot.com/random_joke';

  Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final joke = Joke.fromJson(jsonData);
      return joke;
    } else {
      throw Exception('Failed to fetch joke');
    }
  }
}
