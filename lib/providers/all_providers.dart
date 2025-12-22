import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/quote_model.dart';
import '../models/currency_model.dart';
import '../models/movie_model.dart';
import '../models/fact_model.dart';
import '../services/quote_service.dart';
import '../services/currency_service.dart';
import '../services/movie_service.dart';
import '../services/fact_service.dart';

// Quote Provider
final quoteServiceProvider = Provider((ref) => QuoteService());
final quoteProvider = FutureProvider<Quote>((ref) async {
  return ref.watch(quoteServiceProvider).fetchQuote();
});

// Currency Provider
final currencyServiceProvider = Provider((ref) => CurrencyService());
final currencyProvider = FutureProvider<CurrencyData>((ref) async {
  return ref.watch(currencyServiceProvider).fetchCurrency();
});

// Movie Provider
final movieServiceProvider = Provider((ref) => MovieService());
final movieQueryProvider = StateProvider<String>((ref) => 'Inception');
final movieProvider = FutureProvider<Movie>((ref) async {
  final query = ref.watch(movieQueryProvider);
  return ref.watch(movieServiceProvider).fetchMovie(query);
});

// Fact Provider
final factServiceProvider = Provider((ref) => FactService());
final factProvider = FutureProvider<Fact>((ref) async {
  return ref.watch(factServiceProvider).fetchFact();
});
