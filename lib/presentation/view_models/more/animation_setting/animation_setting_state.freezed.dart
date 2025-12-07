// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animation_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AnimationSettingState {
  DialogAnimationType get selectedType => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of AnimationSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimationSettingStateCopyWith<AnimationSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimationSettingStateCopyWith<$Res> {
  factory $AnimationSettingStateCopyWith(
    AnimationSettingState value,
    $Res Function(AnimationSettingState) then,
  ) = _$AnimationSettingStateCopyWithImpl<$Res, AnimationSettingState>;
  @useResult
  $Res call({DialogAnimationType selectedType, bool isLoading});
}

/// @nodoc
class _$AnimationSettingStateCopyWithImpl<
  $Res,
  $Val extends AnimationSettingState
>
    implements $AnimationSettingStateCopyWith<$Res> {
  _$AnimationSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimationSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? selectedType = null, Object? isLoading = null}) {
    return _then(
      _value.copyWith(
            selectedType: null == selectedType
                ? _value.selectedType
                : selectedType // ignore: cast_nullable_to_non_nullable
                      as DialogAnimationType,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimationSettingStateImplCopyWith<$Res>
    implements $AnimationSettingStateCopyWith<$Res> {
  factory _$$AnimationSettingStateImplCopyWith(
    _$AnimationSettingStateImpl value,
    $Res Function(_$AnimationSettingStateImpl) then,
  ) = __$$AnimationSettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DialogAnimationType selectedType, bool isLoading});
}

/// @nodoc
class __$$AnimationSettingStateImplCopyWithImpl<$Res>
    extends
        _$AnimationSettingStateCopyWithImpl<$Res, _$AnimationSettingStateImpl>
    implements _$$AnimationSettingStateImplCopyWith<$Res> {
  __$$AnimationSettingStateImplCopyWithImpl(
    _$AnimationSettingStateImpl _value,
    $Res Function(_$AnimationSettingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimationSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? selectedType = null, Object? isLoading = null}) {
    return _then(
      _$AnimationSettingStateImpl(
        selectedType: null == selectedType
            ? _value.selectedType
            : selectedType // ignore: cast_nullable_to_non_nullable
                  as DialogAnimationType,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$AnimationSettingStateImpl implements _AnimationSettingState {
  const _$AnimationSettingStateImpl({
    required this.selectedType,
    required this.isLoading,
  });

  @override
  final DialogAnimationType selectedType;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AnimationSettingState(selectedType: $selectedType, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimationSettingStateImpl &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedType, isLoading);

  /// Create a copy of AnimationSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimationSettingStateImplCopyWith<_$AnimationSettingStateImpl>
  get copyWith =>
      __$$AnimationSettingStateImplCopyWithImpl<_$AnimationSettingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AnimationSettingState implements AnimationSettingState {
  const factory _AnimationSettingState({
    required final DialogAnimationType selectedType,
    required final bool isLoading,
  }) = _$AnimationSettingStateImpl;

  @override
  DialogAnimationType get selectedType;
  @override
  bool get isLoading;

  /// Create a copy of AnimationSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimationSettingStateImplCopyWith<_$AnimationSettingStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
