import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/movie_model.dart';

class MovieService {
  final Dio _dio = Dio();
  String get apiKey => dotenv.env['OMDB_API_KEY'] ?? ''; 

  Future<Movie> fetchMovie(String query) async {
    if (apiKey.isEmpty) {
        throw Exception('OMDb API Key not found in .env file');
    }

    try {
      // Step 1: Perform a "Fuzzy Search" using the 's' parameter
      final searchResponse = await _dio.get('https://www.omdbapi.com/', queryParameters: {
        's': query,
        'apikey': apiKey,
      });

      if (searchResponse.data['Response'] != 'True') {
         throw Exception(searchResponse.data['Error'] ?? 'Movie not found');
      }

      // Step 2: Get the best match
      final List<dynamic> results = searchResponse.data['Search'];
      if (results.isEmpty) {
        throw Exception('No results found');
      }
      
      final String imdbID = results[0]['imdbID'];

      // Step 3: Fetch the full details using the 'i' parameter
      final detailsResponse = await _dio.get('https://www.omdbapi.com/', queryParameters: {
        'i': imdbID,
        'plot': 'short',
        'apikey': apiKey,
      });

      if (detailsResponse.data['Response'] == 'True') {
        return Movie.fromJson(detailsResponse.data);
      } else {
        throw Exception(detailsResponse.data['Error'] ?? 'Failed to load movie details');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}
