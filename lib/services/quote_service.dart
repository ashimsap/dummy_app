import 'package:dio/dio.dart';
import '../models/quote_model.dart';

class QuoteService {
  final Dio _dio = Dio();

  Future<Quote> fetchQuote() async {
    try {
      final response = await _dio.get('https://zenquotes.io/api/random');
      // The API returns a JSON array with one quote object
      final List<dynamic> data = response.data;
      if (data.isNotEmpty) {
        return Quote.fromJson(data[0]);
      } else {
        throw Exception('API returned an empty list');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load quote: ${e.message}');
    }
  }
}
