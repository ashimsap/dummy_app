import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/fact_model.dart';

class FactService {
  Future<Fact> fetchFact() async {
    final response = await http.get(Uri.parse('https://uselessfacts.jsph.pl/api/v2/facts/random'));
    if (response.statusCode == 200) {
      return Fact.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load fact');
    }
  }
}
