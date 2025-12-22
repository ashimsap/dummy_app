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
              data: (fact) => Text(
                fact.text,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.refresh(factProvider),
              child: const Text('New Random Fact'),
            ),
          ],
        ),
      ),
    );
  }
}
