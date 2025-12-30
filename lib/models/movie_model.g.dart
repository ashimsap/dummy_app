// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
  title: json['Title'] as String,
  year: json['Year'] as String,
  poster: json['Poster'] as String,
  plot: json['Plot'] as String?,
  rated: json['Rated'] as String?,
  runtime: json['Runtime'] as String?,
  genre: json['Genre'] as String?,
  director: json['Director'] as String?,
  actors: json['Actors'] as String?,
  imdbRating: json['imdbRating'] as String?,
);

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Poster': instance.poster,
      'Plot': instance.plot,
      'Rated': instance.rated,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Actors': instance.actors,
      'imdbRating': instance.imdbRating,
    };
