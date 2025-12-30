import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class FactScreen extends ConsumerWidget {
  const FactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factAsyncValue = ref.watch(factProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            factAsyncValue.when(
              data: (fact) => Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lightbulb, size: 48, color: Theme.of(context).colorScheme.onSecondaryContainer),
                      const SizedBox(height: 16),
                      Text(
                        'Did you know?',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        fact.text,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                          fontSize: 18,
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
                      child: Text('Error: $err', style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)))
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.refresh(factProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('New Random Fact'),
            ),
          ],
        ),
      ),
    );
  }
}
