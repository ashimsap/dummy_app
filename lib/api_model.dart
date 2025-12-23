import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_model.freezed.dart';
part 'api_model.g.dart';

// Helper function to convert dynamic id (int or String) to String
String _idToString(dynamic id) => id.toString();

@freezed
class Joke with _$Joke {
  const factory Joke({
    required String type,
    required String setup,
    required String punchline,
    // Add logic to handle both int and String for 'id'
    @JsonKey(fromJson: _idToString) required String id,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}