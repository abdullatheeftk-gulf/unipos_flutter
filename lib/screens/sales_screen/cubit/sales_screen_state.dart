part of 'sales_screen_cubit.dart';

@freezed
class SalesScreenState with _$SalesScreenState {

  const factory SalesScreenState.initial() = _Initial;

  const factory SalesScreenState.slaesScreenBuildState({
    required String date,
    required String time,
    @Default(null) Customer? selectedCustomer,
    @Default(false) bool isLoading,
  }) = _SalesScreenBuildState;


  const factory SalesScreenState.slaesScreenListenerState({
    required String? errorMessage,
  }) = _SlaesScreenListenerState;

  const factory SalesScreenState.salesScreenCustomerSelectionBuildState({
    required List<Customer> customers,
    @Default(false) bool isLoading,
  }) = _SalesScreenCustomerSelectionBuildState;


  const factory SalesScreenState.salesScreenCustomerSelectionListenerState({
    required String? errorMessage,
  }) = _SalesScreenCustomerSelectionListenerState;
}
