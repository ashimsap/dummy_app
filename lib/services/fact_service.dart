import 'package:dio/dio.dart';
import '../models/fact_model.dart';

class FactService {
  final Dio _dio = Dio();

  Future<Fact> fetchFact() async {
    try {
      final response = await _dio.get('https://uselessfacts.jsph.pl/api/v2/facts/random');
      return Fact.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load fact: ${e.message}');
    }
  }
}
