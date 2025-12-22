import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class QuoteService {
  Future<Quote> fetchQuote() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/random'));
    if (response.statusCode == 200) {
      // The API returns a JSON array with one quote object
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return Quote.fromJson(data[0]);
      } else {
        throw Exception('API returned an empty list');
      }
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
