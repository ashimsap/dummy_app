import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'joke_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokeState = ref.watch(jokeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Joke App")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (jokeState.isLoading)
                const CircularProgressIndicator()
              else if (jokeState.joke != null) ...[
                Text(
                  jokeState.joke!.setup,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  jokeState.joke!.punchline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ] else
                const Text("Press the button to get a joke!"),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  ref.read(jokeProvider.notifier).getJoke();
                },
                child: const Text('Get Joke'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
