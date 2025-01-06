import 'package:unipos_flutter/models/api/customer/customer.dart';

class SharedDataModel {
  final Customer? selectedCustomer;

  SharedDataModel({ this.selectedCustomer});

  @override
  String toString() {
    return 'SharedDataModel(selectedCustomer: $selectedCustomer)';
  }
}