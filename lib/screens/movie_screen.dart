import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(movieProvider);

    void performSearch(String query) {
      if (query.isNotEmpty) {
        ref.read(movieQueryProvider.notifier).state = query;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SearchBar(
                  hintText: 'Search for a movie...',
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 16.0)),
                  onSubmitted: (value) {
                    performSearch(value);
                  },
                  leading: const Icon(Icons.search),
                ),
              ),
              Expanded(
                child: movieAsyncValue.when(
                  data: (movie) => Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (movie.poster.isNotEmpty && movie.poster != 'N/A')
                            Image.network(movie.poster,
                                height: 300,
                                errorBuilder: (c, e, s) =>
                                    const Icon(Icons.movie, size: 100))
                          else
                            const Icon(Icons.movie, size: 100),
                          const SizedBox(height: 10),
                          Text(movie.title,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                          Text('(${movie.year})',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey)),
                          const SizedBox(height: 10),
                          if (movie.plot != null)
                            Text(movie.plot!,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
