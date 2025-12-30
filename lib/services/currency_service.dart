import 'package:dio/dio.dart';
import '../models/currency_model.dart';

class CurrencyService {
  final Dio _dio = Dio();

  Future<CurrencyData> fetchCurrency() async {
    try {
      final response = await _dio.get('https://api.exchangerate-api.com/v4/latest/USD');
      return CurrencyData.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load currency: ${e.message}');
    }
  }
}
