import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

class JokeService {
  Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
