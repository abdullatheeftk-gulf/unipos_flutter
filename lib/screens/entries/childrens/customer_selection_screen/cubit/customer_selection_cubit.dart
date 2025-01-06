import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unipos_flutter/models/api/customer/customer.dart';
import 'package:unipos_flutter/models/app/shared_data_model.dart';
import 'package:unipos_flutter/repositories/api/api_repository.dart';
import 'package:unipos_flutter/repositories/shared/shared_repository.dart';

part 'customer_selection_state.dart';
part 'customer_selection_cubit.freezed.dart';

class CustomerSelectionCubit extends Cubit<CustomerSelectionState> {
  final ApiRepository apiRepository;
  final SharedRepository sharedRepository;

  CustomerSelectionCubit({
    required this.apiRepository,
    required this.sharedRepository,
  }) : super(CustomerSelectionState.initial()) {
    _fetchCustomers();
  }

  void _fetchCustomers() async {
    try {
      emit(CustomerSelectionState.customerSelectionBuildState(
          showProgressBar: true));
      final customers = await apiRepository.fetchCustomers();
      if (customers.isEmpty) {
        emit(CustomerSelectionState.customerSelectionBuildState(
            showEmptyListMessage: true, showProgressBar: false));
        return;
      }
      emit(CustomerSelectionState.customerSelectionBuildState(
          customers: customers, showProgressBar: false));
    } catch (e) {
      emit(CustomerSelectionState.customerSelectionBuildState(
          showProgressBar: false));
      emit(CustomerSelectionState.customerSelectionListenState(
          errorMessage: e.toString()));
    }
  }

  void onCustomerSelected(Customer customer) {
    sharedRepository.sharedDataModelController.sink.add(SharedDataModel(selectedCustomer: customer));
  }
}
