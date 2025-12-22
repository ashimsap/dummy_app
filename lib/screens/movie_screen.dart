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
      appBar: AppBar(
        title: SearchAnchor(
          searchController: _searchController,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () => controller.openView(),
              onChanged: (_) => controller.openView(),
              leading: const Icon(Icons.search),
              // This handles submission directly from the SearchBar
              onSubmitted: _performSearch, 
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            // Sample suggestions
            final suggestions = ['Inception', 'The Dark Knight', 'Interstellar'];
            return suggestions.map((item) {
              return ListTile(
                title: Text(item),
                onTap: () {
                  // Set the search text and close the view, which triggers the search
                  controller.closeView(item);
                  _performSearch(item);
                },
              );
            }).toList();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: movieAsyncValue.when(
          data: (movie) => SingleChildScrollView(
            child: Column(
              children: [
                if (movie.poster != 'N/A')
                  Image.network(movie.poster, height: 300)
                else
                  const Icon(Icons.movie, size: 100),
                const SizedBox(height: 10),
                Text(movie.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
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
    );
  }
}
