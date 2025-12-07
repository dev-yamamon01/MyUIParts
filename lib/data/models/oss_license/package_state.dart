import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../presentation/view_models/more/oss_license/oss_licenses.dart';

part 'package_state.freezed.dart';

@freezed
class PackageState with _$PackageState {
  const factory PackageState({
    required List<Package> items,
    @Default(false) bool isLoading,
    @Default(true) bool hasMore,
    @Default(0) int page,
  }) = _PackageState;
}