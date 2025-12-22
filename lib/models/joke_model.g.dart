// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JokeImpl _$$JokeImplFromJson(Map<String, dynamic> json) => _$JokeImpl(
  setup: json['setup'] as String,
  punchline: json['punchline'] as String,
  id: _idToString(json['id']),
  type: json['type'] as String,
);

Map<String, dynamic> _$$JokeImplToJson(_$JokeImpl instance) =>
    <String, dynamic>{
      'setup': instance.setup,
      'punchline': instance.punchline,
      'id': instance.id,
      'type': instance.type,
    };
