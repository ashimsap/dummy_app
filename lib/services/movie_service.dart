import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieService {
  final String apiKey = '3bdb8de2'; // Using the API key from your project

  // Fetches a single, detailed movie by its title
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

  // Searches for a list of movies matching a query
  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(Uri.parse('https://www.omdbapi.com/?s=$query&apikey=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['Response'] == 'True') {
        final List<dynamic> searchResults = data['Search'];
        return searchResults.map((json) => Movie.fromJson(json)).toList();
      } else {
        // OMDb returns an error if less than 3 characters are provided, which we can ignore
        if(data['Error'] == 'Too many results.' || data['Error'] == 'Movie not found!'){
            return [];
        }
        throw Exception(data['Error'] ?? 'Search failed');
      }
    } else {
      throw Exception('Failed to connect to the service');
    }
  }
}
