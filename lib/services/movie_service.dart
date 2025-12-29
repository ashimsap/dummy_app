import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/movie_model.dart';

class MovieService {
  String get apiKey => dotenv.env['OMDB_API_KEY'] ?? ''; 

  Future<Movie> fetchMovie(String query) async {
    if (apiKey.isEmpty) {
        throw Exception('OMDb API Key not found in .env file');
    }

    // Step 1: Perform a "Fuzzy Search" using the 's' parameter
    // This returns a list of matches even for partial titles
    final searchUri = Uri.parse('https://www.omdbapi.com/?s=$query&apikey=$apiKey');
    final searchResponse = await http.get(searchUri);

    if (searchResponse.statusCode != 200) {
      throw Exception('Failed to connect to search service');
    }

    final searchData = json.decode(searchResponse.body);

    // If the search found nothing, throw an error
    if (searchData['Response'] != 'True') {
       throw Exception(searchData['Error'] ?? 'Movie not found');
    }

    // Step 2: Get the best match (the first item in the list)
    final List<dynamic> results = searchData['Search'];
    if (results.isEmpty) {
      throw Exception('No results found');
    }
    
    // We get the imdbID to ensure we fetch the exact specific movie details
    final String imdbID = results[0]['imdbID'];

    // Step 3: Fetch the full details using the 'i' parameter (By ID)
    final detailsUri = Uri.parse('https://www.omdbapi.com/?i=$imdbID&plot=short&apikey=$apiKey');
    final detailsResponse = await http.get(detailsUri);

    if (detailsResponse.statusCode == 200) {
      final detailsData = json.decode(detailsResponse.body);
      if (detailsData['Response'] == 'True') {
        return Movie.fromJson(detailsData);
      } else {
        throw Exception(detailsData['Error'] ?? 'Failed to load movie details');
      }
    } else {
      throw Exception('Failed to load details');
    }
  }
}
