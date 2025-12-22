import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  final String apiKey = '3bdb8de2'; // Replace with your OMDb API Key

  Future<Movie> fetchMovie(String title) async {
    final response = await http.get(Uri.parse('https://www.omdbapi.com/?t=$title&apikey=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Response'] == 'True') {
         return Movie.fromJson(data);
      } else {
        throw Exception(data['Error'] ?? 'Movie not found');
      }
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
