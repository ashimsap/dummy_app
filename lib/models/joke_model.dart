import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke_model.freezed.dart';
part 'joke_model.g.dart';

String _idToString(dynamic id) => id.toString();

@freezed
class Joke with _$Joke {
  const factory Joke({
    required String setup,
    required String punchline,
    @JsonKey(fromJson: _idToString) required String id,
    required String type,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}
