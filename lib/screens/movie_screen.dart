import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(movieProvider);
    final TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter Movie Title',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                   if (_controller.text.isNotEmpty) {
                     ref.read(movieQueryProvider.notifier).state = _controller.text;
                   }
                },
              ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                 ref.read(movieQueryProvider.notifier).state = value;
              }
            },
          ),
          const SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
