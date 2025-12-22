import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';

class CurrencyService {
  Future<CurrencyData> fetchCurrency() async {
    // Using a free API that doesn't require auth for basic rates, or replace with your preferred one
    final response = await http.get(Uri.parse('https://api.exchangerate-api.com/v4/latest/USD'));
    if (response.statusCode == 200) {
      return CurrencyData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load currency');
    }
  }
}
