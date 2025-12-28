import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import '../models/movie_model.dart';

class MovieService {
  // Read the API key from the .env file.
  // We use ?? '' to provide a fallback empty string if the key is missing,
  // but in a real app you might want to throw an error.
  final String apiKey = dotenv.env['OMDB_API_KEY'] ?? ''; 

  // Fetches a single, detailed movie by its title
  Future<Movie> fetchMovie(String title) async {
    // It's good practice to check if the key is valid
    if (apiKey.isEmpty) {
        throw Exception('OMDb API Key not found in .env file');
    }

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
