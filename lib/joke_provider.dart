import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_model.dart';
import 'api_service.dart';

part 'joke_provider.freezed.dart';

@freezed
class JokeState with _$JokeState {
  const factory JokeState({
    Joke? joke,
    @Default(false) bool isLoading,
  }) = _JokeState;
}

class JokeNotifier extends Notifier<JokeState> {
  final JokeService _service = JokeService();

  @override
  JokeState build() {
    return const JokeState();
  }

  Future<void> getJoke() async {
    state = state.copyWith(isLoading: true);
    try {
      final fetchedJoke = await _service.fetchJoke();
      state = state.copyWith(joke: fetchedJoke, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        joke: const Joke(id: '0', type: 'error', setup: 'Failed to Load Joke', punchline: ''),
        isLoading: false,
      );
    }
  }
}
final jokeProvider = NotifierProvider<JokeNotifier, JokeState>(JokeNotifier.new);
