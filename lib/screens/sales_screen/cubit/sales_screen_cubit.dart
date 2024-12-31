import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unipos_flutter/models/customer/customer.dart';
import 'package:unipos_flutter/repositories/api/api_repository.dart';
import 'package:unipos_flutter/screens/common_widgets/date_selector_dialog.dart';
import 'package:unipos_flutter/util/date_time_format.dart';
import 'package:unipos_flutter/util/log_functions.dart';

part 'sales_screen_state.dart';
part 'sales_screen_cubit.freezed.dart';

class SalesScreenCubit extends Cubit<SalesScreenState> {
  final ApiRepository apiRepository;
  final Dio dio;

  String _date = dateFormat(DateTime.now());
  String _time = timeFormat(DateTime.now());
  TimeOfDay _timeOfDay = TimeOfDay.now();

  List<Customer> _customers = [];
  Customer? _selectedCustomer;

  SalesScreenCubit({
    required this.apiRepository,
    required this.dio,
  }) : super(SalesScreenState.initial());

  void _fetchCustomers() async {
    _customers = await apiRepository.fetchCustomers(dio);
    
    
  }

  void changeDate(BuildContext context) async {
    final dateTime =
        await showDateSelectorDialog(context: context) ?? DateTime.now();
    _date = dateFormat(dateTime);
    _buildSalesScreenEmit();
  }

  void changeTime(BuildContext context) async {
    _timeOfDay =
        await showTimeSelectorDialog(context: context) ?? TimeOfDay.now();
    warningLog(_timeOfDay);
    final currentDate = DateTime.now();
    _time = timeFormat(DateTime(currentDate.year, currentDate.month,
        currentDate.day, _timeOfDay.hour, _timeOfDay.minute));
    _buildSalesScreenEmit();
  }

  void _buildSalesScreenEmit() {
    emit(
      SalesScreenState.slaesScreenBuildState(
        date: _date,
        time: _time,
        selectedCustomer: _selectedCustomer,
      ),
    );
  }
}
