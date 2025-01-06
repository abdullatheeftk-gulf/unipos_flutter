part of 'customer_selection_cubit.dart';

@freezed
class CustomerSelectionState with _$CustomerSelectionState {
  const factory CustomerSelectionState.initial() = _Initial;
  const factory CustomerSelectionState.customerSelectionBuildState({
    @Default(null) List<Customer>? customers,
    @Default(false) bool showEmptyListMessage,
    @Default(false) bool showProgressBar,
    @Default(null) String? errorMessage,

  }) = _CustomerSelectionBuildState;

  const factory CustomerSelectionState.customerSelectionListenState({
    required String errorMessage,
  }) = _CustomerSelectionListenState;
}
