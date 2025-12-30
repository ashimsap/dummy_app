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
                  padding: WidgetStateProperty.all<EdgeInsets>(
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
                      child: Card(
                        // Add Card wrapping for consistency
                        elevation: 0, // Using 0 to blend with background or low elevation if preferred
                        color: Colors.transparent, // Or use Theme.of(context).cardColor
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (movie.poster.isNotEmpty && movie.poster != 'N/A')
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(movie.poster, height: 300, fit: BoxFit.cover, errorBuilder: (c, e, s) => const Icon(Icons.movie, size: 100)),
                              )
                            else
                              const Icon(Icons.movie, size: 100),
                            const SizedBox(height: 20),
                            Text(
                              movie.title,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              children: [
                                Chip(
                                  label: Text(movie.year),
                                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                                ),
                                if (movie.rated != null) Chip(
                                  label: Text(movie.rated!),
                                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                                ),
                                if (movie.runtime != null) Chip(
                                  label: Text(movie.runtime!),
                                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            if (movie.genre != null)
                               Text(movie.genre!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic, color: Theme.of(context).colorScheme.secondary)),
                             const SizedBox(height: 16),
                            if (movie.imdbRating != null)
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   const Icon(Icons.star, color: Colors.amber),
                                   const SizedBox(width: 4),
                                   Text('${movie.imdbRating}/10', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                                 ],
                               ),
                             const SizedBox(height: 16),
                             if (movie.plot != null)
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                 child: Text(movie.plot!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5), textAlign: TextAlign.center),
                               ),
                             const SizedBox(height: 24),
                             _buildInfoSection(context, 'Director', movie.director),
                             _buildInfoSection(context, 'Actors', movie.actors),
                          ],
                        ),
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

  Widget _buildInfoSection(BuildContext context, String title, String? content) {
    if (content == null || content == 'N/A') return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Column(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary)),
          const SizedBox(height: 4),
          Text(content, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
