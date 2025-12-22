import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/quote_model.dart';
import '../models/currency_model.dart';
import '../models/movie_model.dart';
import '../models/fact_model.dart';
import '../models/joke_model.dart'; // Import Joke Model
import '../services/quote_service.dart';
import '../services/currency_service.dart';
import '../services/movie_service.dart';
import '../services/fact_service.dart';
import '../services/joke_service.dart'; // Import Joke Service

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

// --- Movie Providers ---
final movieServiceProvider = Provider((ref) => MovieService());

// Manages the title for the main movie display
final movieQueryProvider = StateProvider<String>((ref) => 'Avatar: Fire and Ash');

// Fetches the single, detailed movie to display on the screen
final movieProvider = FutureProvider<Movie>((ref) async {
  final query = ref.watch(movieQueryProvider);
  return ref.watch(movieServiceProvider).fetchMovie(query);
});

// Fact Provider
final factServiceProvider = Provider((ref) => FactService());
final factProvider = FutureProvider<Fact>((ref) async {
  return ref.watch(factServiceProvider).fetchFact();
});

// Joke Provider
final jokeServiceProvider = Provider((ref) => JokeService());
final jokeProvider = FutureProvider<Joke>((ref) async {
  return ref.watch(jokeServiceProvider).fetchJoke();
});
