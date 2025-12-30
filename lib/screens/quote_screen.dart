import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class QuoteScreen extends ConsumerWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsyncValue = ref.watch(quoteProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            quoteAsyncValue.when(
              data: (quote) => Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Ensures card shrinks to fit content
                    children: [
                      Icon(Icons.format_quote, size: 48, color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5)),
                      const SizedBox(height: 16),
                      Text(
                        '"${quote.content}"',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '- ${quote.author}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                          textAlign: TextAlign.right,
                        ),
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
                  child: Text('Error: $err', style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.refresh(quoteProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
