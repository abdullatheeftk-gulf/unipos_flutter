import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/models/api/customer/customer.dart';
import 'package:unipos_flutter/screens/entries/childrens/customer_selection_screen/cubit/customer_selection_cubit.dart';
import 'package:unipos_flutter/util/general_functions.dart';

class CustomerSelectionWidget extends StatelessWidget {
  final Customer customer;
  const CustomerSelectionWidget({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final customerName =customer.name;
    return InkWell(
      onTap: (){
        context.read<CustomerSelectionCubit>().onCustomerSelected(customer);
        Navigator.pop(context);
      },
      child: Row(
        children: [
           CircleAvatar(
            radius: 20,
            backgroundColor: getRandomLightColor(),
            child: Text(customerName[0].toUpperCase()),
          ),
          const SizedBox(width: 10),
          Text(customerName),
        ],
      ),
    );
  }
}