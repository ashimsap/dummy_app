import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({super.key});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  final SearchController _searchController = SearchController();

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      ref.read(movieQueryProvider.notifier).state = query;
    }
  }

  @override
  Widget build(BuildContext context) {
    final movieAsyncValue = ref.watch(movieProvider);

    return Scaffold(
      // The AppBar has been removed to prevent shadow clipping
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Search bar is now the first item in the body
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SearchAnchor(
                  searchController: _searchController,
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () => controller.openView(),
                      onChanged: (_) => controller.openView(),
                      leading: const Icon(Icons.search),
                      onSubmitted: _performSearch,
                    );
                  },
                  suggestionsBuilder: (BuildContext context, SearchController controller) {
                    final suggestions = ['Inception', 'The Dark Knight', 'Interstellar'];
                    return suggestions.map((item) {
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          controller.closeView(item);
                          _performSearch(item);
                        },
                      );
                    }).toList();
                  },
                ),
              ),
              // The movie results now take up the remaining space
              Expanded(
                child: movieAsyncValue.when(
                  data: (movie) => SingleChildScrollView(
                    child: Column(
                      children: [
                        if (movie.poster != 'N/A')
                          Image.network(movie.poster, height: 300)
                        else
                          const Icon(Icons.movie, size: 100),
                        const SizedBox(height: 10),
                        Text(movie.title,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        Text('(${movie.year})', style: const TextStyle(fontSize: 18, color: Colors.grey)),
                        const SizedBox(height: 10),
                        Text(movie.plot, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
                      ],
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
