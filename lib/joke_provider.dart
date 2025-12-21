import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_model.dart';
import 'api_service.dart';

class JokeState {
  final Joke? joke;
  final bool isLoading;

  JokeState({this.joke, this.isLoading = false});

  JokeState copyWith({Joke? joke, bool? isLoading}) {
    return JokeState(
      joke: joke ?? this.joke,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class JokeNotifier extends Notifier<JokeState> {
  final JokeService _service = JokeService();

  @override
  JokeState build() {
    return JokeState();
  }

  Future<void> getJoke() async {
    state = state.copyWith(isLoading: true);
    try {
      final fetchedJoke = await _service.fetchJoke();
      state = state.copyWith(joke: fetchedJoke, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        joke: Joke(id: '0', type: 'error', setup: 'Failed to Load Joke', punchline: ''),
        isLoading: false,
      );
    }
  }
}

final jokeProvider = NotifierProvider<JokeNotifier, JokeState>(JokeNotifier.new);
