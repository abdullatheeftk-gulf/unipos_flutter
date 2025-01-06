import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/models/api/customer/customer.dart';
import 'package:unipos_flutter/repositories/api/api_repository.dart';
import 'package:unipos_flutter/repositories/shared/shared_repository.dart';
import 'package:unipos_flutter/screens/entries/childrens/customer_selection_screen/cubit/customer_selection_cubit.dart';
import 'package:unipos_flutter/screens/entries/childrens/customer_selection_screen/widget/customer_selection_widget.dart';
import 'package:unipos_flutter/screens/entries/childrens/sales_screen/cubit/sales_screen_cubit.dart';
import 'package:unipos_flutter/util/snackbar.dart';

class CustomerSelectionScreen extends StatefulWidget {
  const CustomerSelectionScreen({super.key});

  @override
  State<CustomerSelectionScreen> createState() =>
      _CustomerSelectionScreenState();
}

class _CustomerSelectionScreenState extends State<CustomerSelectionScreen> {
  List<Customer>? _customerList;
  bool _showProgressBar = false;
  String? _errorMessage;
  bool _showEmptyListMessage = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerSelectionCubit(
       apiRepository:  context.read<ApiRepository>(),
       sharedRepository: context.read<SharedRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Customer Selection'),
        ),
        body: BlocConsumer<CustomerSelectionCubit, CustomerSelectionState>(
          listener: (context, state) {
            state.mapOrNull(customerSelectionBuildState: (value){
                final errorMessage = value.errorMessage;
                if(errorMessage != null){
                  showSnackBar(context: context, message: errorMessage);
                }
            });
          },
          listenWhen: (previous, current) => current.maybeWhen(
            orElse: () => false,
            customerSelectionListenState: (a) => true,
          ),
          buildWhen: (prev, cur) {
            return cur.maybeWhen(
              orElse: () => false,
              customerSelectionBuildState: (a, b, c, d) => true,
            );
          },
          builder: (context, state) {
            state.mapOrNull(
              customerSelectionBuildState: (value) {
                _customerList = value.customers;
                _showProgressBar = value.showProgressBar;
                _errorMessage = value.errorMessage;
                _showEmptyListMessage = value.showEmptyListMessage;
              },
            );

            if (_showEmptyListMessage) {
              return const Center(
                child: Text('No customers found'),
              );
            }

            if (_showProgressBar || _customerList == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_errorMessage != null) {
              return Center(
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomerSelectionWidget(
                          customer: _customerList![index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: _customerList?.length ?? 0,
                  ),
                ),
                if (_showProgressBar)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
