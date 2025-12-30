// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  @JsonKey(name: 'Title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  String get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Poster')
  String get poster => throw _privateConstructorUsedError;
  @JsonKey(name: 'Plot')
  String? get plot => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rated')
  String? get rated => throw _privateConstructorUsedError;
  @JsonKey(name: 'Runtime')
  String? get runtime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Genre')
  String? get genre => throw _privateConstructorUsedError;
  @JsonKey(name: 'Director')
  String? get director => throw _privateConstructorUsedError;
  @JsonKey(name: 'Actors')
  String? get actors => throw _privateConstructorUsedError;
  @JsonKey(name: 'imdbRating')
  String? get imdbRating => throw _privateConstructorUsedError;

  /// Serializes this Movie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call({
    @JsonKey(name: 'Title') String title,
    @JsonKey(name: 'Year') String year,
    @JsonKey(name: 'Poster') String poster,
    @JsonKey(name: 'Plot') String? plot,
    @JsonKey(name: 'Rated') String? rated,
    @JsonKey(name: 'Runtime') String? runtime,
    @JsonKey(name: 'Genre') String? genre,
    @JsonKey(name: 'Director') String? director,
    @JsonKey(name: 'Actors') String? actors,
    @JsonKey(name: 'imdbRating') String? imdbRating,
  });
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? poster = null,
    Object? plot = freezed,
    Object? rated = freezed,
    Object? runtime = freezed,
    Object? genre = freezed,
    Object? director = freezed,
    Object? actors = freezed,
    Object? imdbRating = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String,
            poster: null == poster
                ? _value.poster
                : poster // ignore: cast_nullable_to_non_nullable
                      as String,
            plot: freezed == plot
                ? _value.plot
                : plot // ignore: cast_nullable_to_non_nullable
                      as String?,
            rated: freezed == rated
                ? _value.rated
                : rated // ignore: cast_nullable_to_non_nullable
                      as String?,
            runtime: freezed == runtime
                ? _value.runtime
                : runtime // ignore: cast_nullable_to_non_nullable
                      as String?,
            genre: freezed == genre
                ? _value.genre
                : genre // ignore: cast_nullable_to_non_nullable
                      as String?,
            director: freezed == director
                ? _value.director
                : director // ignore: cast_nullable_to_non_nullable
                      as String?,
            actors: freezed == actors
                ? _value.actors
                : actors // ignore: cast_nullable_to_non_nullable
                      as String?,
            imdbRating: freezed == imdbRating
                ? _value.imdbRating
                : imdbRating // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
    _$MovieImpl value,
    $Res Function(_$MovieImpl) then,
  ) = __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'Title') String title,
    @JsonKey(name: 'Year') String year,
    @JsonKey(name: 'Poster') String poster,
    @JsonKey(name: 'Plot') String? plot,
    @JsonKey(name: 'Rated') String? rated,
    @JsonKey(name: 'Runtime') String? runtime,
    @JsonKey(name: 'Genre') String? genre,
    @JsonKey(name: 'Director') String? director,
    @JsonKey(name: 'Actors') String? actors,
    @JsonKey(name: 'imdbRating') String? imdbRating,
  });
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
    _$MovieImpl _value,
    $Res Function(_$MovieImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? year = null,
    Object? poster = null,
    Object? plot = freezed,
    Object? rated = freezed,
    Object? runtime = freezed,
    Object? genre = freezed,
    Object? director = freezed,
    Object? actors = freezed,
    Object? imdbRating = freezed,
  }) {
    return _then(
      _$MovieImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String,
        poster: null == poster
            ? _value.poster
            : poster // ignore: cast_nullable_to_non_nullable
                  as String,
        plot: freezed == plot
            ? _value.plot
            : plot // ignore: cast_nullable_to_non_nullable
                  as String?,
        rated: freezed == rated
            ? _value.rated
            : rated // ignore: cast_nullable_to_non_nullable
                  as String?,
        runtime: freezed == runtime
            ? _value.runtime
            : runtime // ignore: cast_nullable_to_non_nullable
                  as String?,
        genre: freezed == genre
            ? _value.genre
            : genre // ignore: cast_nullable_to_non_nullable
                  as String?,
        director: freezed == director
            ? _value.director
            : director // ignore: cast_nullable_to_non_nullable
                  as String?,
        actors: freezed == actors
            ? _value.actors
            : actors // ignore: cast_nullable_to_non_nullable
                  as String?,
        imdbRating: freezed == imdbRating
            ? _value.imdbRating
            : imdbRating // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl implements _Movie {
  const _$MovieImpl({
    @JsonKey(name: 'Title') required this.title,
    @JsonKey(name: 'Year') required this.year,
    @JsonKey(name: 'Poster') required this.poster,
    @JsonKey(name: 'Plot') this.plot,
    @JsonKey(name: 'Rated') this.rated,
    @JsonKey(name: 'Runtime') this.runtime,
    @JsonKey(name: 'Genre') this.genre,
    @JsonKey(name: 'Director') this.director,
    @JsonKey(name: 'Actors') this.actors,
    @JsonKey(name: 'imdbRating') this.imdbRating,
  });

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  @JsonKey(name: 'Title')
  final String title;
  @override
  @JsonKey(name: 'Year')
  final String year;
  @override
  @JsonKey(name: 'Poster')
  final String poster;
  @override
  @JsonKey(name: 'Plot')
  final String? plot;
  @override
  @JsonKey(name: 'Rated')
  final String? rated;
  @override
  @JsonKey(name: 'Runtime')
  final String? runtime;
  @override
  @JsonKey(name: 'Genre')
  final String? genre;
  @override
  @JsonKey(name: 'Director')
  final String? director;
  @override
  @JsonKey(name: 'Actors')
  final String? actors;
  @override
  @JsonKey(name: 'imdbRating')
  final String? imdbRating;

  @override
  String toString() {
    return 'Movie(title: $title, year: $year, poster: $poster, plot: $plot, rated: $rated, runtime: $runtime, genre: $genre, director: $director, actors: $actors, imdbRating: $imdbRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.plot, plot) || other.plot == plot) &&
            (identical(other.rated, rated) || other.rated == rated) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.director, director) ||
                other.director == director) &&
            (identical(other.actors, actors) || other.actors == actors) &&
            (identical(other.imdbRating, imdbRating) ||
                other.imdbRating == imdbRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    year,
    poster,
    plot,
    rated,
    runtime,
    genre,
    director,
    actors,
    imdbRating,
  );

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(this);
  }
}

abstract class _Movie implements Movie {
  const factory _Movie({
    @JsonKey(name: 'Title') required final String title,
    @JsonKey(name: 'Year') required final String year,
    @JsonKey(name: 'Poster') required final String poster,
    @JsonKey(name: 'Plot') final String? plot,
    @JsonKey(name: 'Rated') final String? rated,
    @JsonKey(name: 'Runtime') final String? runtime,
    @JsonKey(name: 'Genre') final String? genre,
    @JsonKey(name: 'Director') final String? director,
    @JsonKey(name: 'Actors') final String? actors,
    @JsonKey(name: 'imdbRating') final String? imdbRating,
  }) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  @JsonKey(name: 'Title')
  String get title;
  @override
  @JsonKey(name: 'Year')
  String get year;
  @override
  @JsonKey(name: 'Poster')
  String get poster;
  @override
  @JsonKey(name: 'Plot')
  String? get plot;
  @override
  @JsonKey(name: 'Rated')
  String? get rated;
  @override
  @JsonKey(name: 'Runtime')
  String? get runtime;
  @override
  @JsonKey(name: 'Genre')
  String? get genre;
  @override
  @JsonKey(name: 'Director')
  String? get director;
  @override
  @JsonKey(name: 'Actors')
  String? get actors;
  @override
  @JsonKey(name: 'imdbRating')
  String? get imdbRating;

  /// Create a copy of Movie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
