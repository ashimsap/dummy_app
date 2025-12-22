// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JokeImpl _$$JokeImplFromJson(Map<String, dynamic> json) => _$JokeImpl(
  type: json['type'] as String,
  setup: json['setup'] as String,
  punchline: json['punchline'] as String,
  id: _idToString(json['id']),
);

Map<String, dynamic> _$$JokeImplToJson(_$JokeImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'setup': instance.setup,
      'punchline': instance.punchline,
      'id': instance.id,
    };
