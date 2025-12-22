// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) {
  return _CurrencyData.fromJson(json);
}

/// @nodoc
mixin _$CurrencyData {
  String get base => throw _privateConstructorUsedError;
  Map<String, double> get rates => throw _privateConstructorUsedError;

  /// Serializes this CurrencyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyDataCopyWith<CurrencyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyDataCopyWith<$Res> {
  factory $CurrencyDataCopyWith(
    CurrencyData value,
    $Res Function(CurrencyData) then,
  ) = _$CurrencyDataCopyWithImpl<$Res, CurrencyData>;
  @useResult
  $Res call({String base, Map<String, double> rates});
}

/// @nodoc
class _$CurrencyDataCopyWithImpl<$Res, $Val extends CurrencyData>
    implements $CurrencyDataCopyWith<$Res> {
  _$CurrencyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? base = null, Object? rates = null}) {
    return _then(
      _value.copyWith(
            base: null == base
                ? _value.base
                : base // ignore: cast_nullable_to_non_nullable
                      as String,
            rates: null == rates
                ? _value.rates
                : rates // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CurrencyDataImplCopyWith<$Res>
    implements $CurrencyDataCopyWith<$Res> {
  factory _$$CurrencyDataImplCopyWith(
    _$CurrencyDataImpl value,
    $Res Function(_$CurrencyDataImpl) then,
  ) = __$$CurrencyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String base, Map<String, double> rates});
}

/// @nodoc
class __$$CurrencyDataImplCopyWithImpl<$Res>
    extends _$CurrencyDataCopyWithImpl<$Res, _$CurrencyDataImpl>
    implements _$$CurrencyDataImplCopyWith<$Res> {
  __$$CurrencyDataImplCopyWithImpl(
    _$CurrencyDataImpl _value,
    $Res Function(_$CurrencyDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrencyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? base = null, Object? rates = null}) {
    return _then(
      _$CurrencyDataImpl(
        base: null == base
            ? _value.base
            : base // ignore: cast_nullable_to_non_nullable
                  as String,
        rates: null == rates
            ? _value._rates
            : rates // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyDataImpl implements _CurrencyData {
  const _$CurrencyDataImpl({
    required this.base,
    required final Map<String, double> rates,
  }) : _rates = rates;

  factory _$CurrencyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyDataImplFromJson(json);

  @override
  final String base;
  final Map<String, double> _rates;
  @override
  Map<String, double> get rates {
    if (_rates is EqualUnmodifiableMapView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rates);
  }

  @override
  String toString() {
    return 'CurrencyData(base: $base, rates: $rates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyDataImpl &&
            (identical(other.base, base) || other.base == base) &&
            const DeepCollectionEquality().equals(other._rates, _rates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    base,
    const DeepCollectionEquality().hash(_rates),
  );

  /// Create a copy of CurrencyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyDataImplCopyWith<_$CurrencyDataImpl> get copyWith =>
      __$$CurrencyDataImplCopyWithImpl<_$CurrencyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyDataImplToJson(this);
  }
}

abstract class _CurrencyData implements CurrencyData {
  const factory _CurrencyData({
    required final String base,
    required final Map<String, double> rates,
  }) = _$CurrencyDataImpl;

  factory _CurrencyData.fromJson(Map<String, dynamic> json) =
      _$CurrencyDataImpl.fromJson;

  @override
  String get base;
  @override
  Map<String, double> get rates;

  /// Create a copy of CurrencyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyDataImplCopyWith<_$CurrencyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
