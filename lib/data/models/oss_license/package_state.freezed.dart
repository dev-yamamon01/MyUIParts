// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PackageState {
  List<Package> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of PackageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageStateCopyWith<PackageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageStateCopyWith<$Res> {
  factory $PackageStateCopyWith(
    PackageState value,
    $Res Function(PackageState) then,
  ) = _$PackageStateCopyWithImpl<$Res, PackageState>;
  @useResult
  $Res call({List<Package> items, bool isLoading, bool hasMore, int page});
}

/// @nodoc
class _$PackageStateCopyWithImpl<$Res, $Val extends PackageState>
    implements $PackageStateCopyWith<$Res> {
  _$PackageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? page = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<Package>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PackageStateImplCopyWith<$Res>
    implements $PackageStateCopyWith<$Res> {
  factory _$$PackageStateImplCopyWith(
    _$PackageStateImpl value,
    $Res Function(_$PackageStateImpl) then,
  ) = __$$PackageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Package> items, bool isLoading, bool hasMore, int page});
}

/// @nodoc
class __$$PackageStateImplCopyWithImpl<$Res>
    extends _$PackageStateCopyWithImpl<$Res, _$PackageStateImpl>
    implements _$$PackageStateImplCopyWith<$Res> {
  __$$PackageStateImplCopyWithImpl(
    _$PackageStateImpl _value,
    $Res Function(_$PackageStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PackageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? hasMore = null,
    Object? page = null,
  }) {
    return _then(
      _$PackageStateImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Package>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PackageStateImpl implements _PackageState {
  const _$PackageStateImpl({
    required final List<Package> items,
    this.isLoading = false,
    this.hasMore = true,
    this.page = 0,
  }) : _items = items;

  final List<Package> _items;
  @override
  List<Package> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'PackageState(items: $items, isLoading: $isLoading, hasMore: $hasMore, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    isLoading,
    hasMore,
    page,
  );

  /// Create a copy of PackageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageStateImplCopyWith<_$PackageStateImpl> get copyWith =>
      __$$PackageStateImplCopyWithImpl<_$PackageStateImpl>(this, _$identity);
}

abstract class _PackageState implements PackageState {
  const factory _PackageState({
    required final List<Package> items,
    final bool isLoading,
    final bool hasMore,
    final int page,
  }) = _$PackageStateImpl;

  @override
  List<Package> get items;
  @override
  bool get isLoading;
  @override
  bool get hasMore;
  @override
  int get page;

  /// Create a copy of PackageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageStateImplCopyWith<_$PackageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
