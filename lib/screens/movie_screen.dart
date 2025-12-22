import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(movieProvider);

    return Scaffold(
      appBar: AppBar(
        // The search bar is implemented as the title of the AppBar
        title: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () => controller.openView(),
              onChanged: (_) => controller.openView(),
              leading: const Icon(Icons.search),
            );
          },
          suggestionsBuilder: (BuildContext context, SearchController controller) {
            // For this example, we'll keep suggestions simple
            return <Widget>[
              ListTile(title: const Text('Inception'), onTap: () => controller.text = 'Inception'),
              ListTile(title: const Text('The Dark Knight'), onTap: () => controller.text = 'The Dark Knight'),
              ListTile(title: const Text('Interstellar'), onTap: () => controller.text = 'Interstellar'),
            ];
          },
          // This is what happens when the user submits the search
          viewOnSubmitted: (String value) {
            if (value.isNotEmpty) {
              ref.read(movieQueryProvider.notifier).state = value;
            }
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
