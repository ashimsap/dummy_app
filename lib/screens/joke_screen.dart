import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class JokeScreen extends ConsumerWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokeAsyncValue = ref.watch(jokeProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            jokeAsyncValue.when(
              data: (joke) => Card(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        joke.setup,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onTertiaryContainer,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      // Replaced full-width Divider with a custom small divider for a more compact look
                      Container(
                        width: 60, 
                        height: 4, 
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        joke.punchline,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onTertiaryContainer,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Card(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Error: $err', style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer))),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.refresh(jokeProvider),
              icon: const Icon(Icons.mood),
              label: const Text('New Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
