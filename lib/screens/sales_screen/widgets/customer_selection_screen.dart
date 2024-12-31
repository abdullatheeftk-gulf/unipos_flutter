import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/models/customer/customer.dart';
import 'package:unipos_flutter/screens/sales_screen/cubit/sales_screen_cubit.dart';

class CustomerSelectionScreen extends StatefulWidget {
  const CustomerSelectionScreen({super.key});

  @override
  State<CustomerSelectionScreen> createState() =>
      _CustomerSelectionScreenState();
}

class _CustomerSelectionScreenState extends State<CustomerSelectionScreen> {

  final List<Customer> customers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Selection'),
      ),
      body: BlocConsumer<SalesScreenCubit, SalesScreenState>(
        listenWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            salesScreenCustomerSelectionListenerState: (a) => true,
          );
        },  
        listener: (context, state) {
          // TODO: implement listener
        },
        buildWhen: (prev,cur){
          return cur.maybeWhen(
            orElse: () => false,
            salesScreenCustomerSelectionBuildState: (a,b) => true,
          );
        },
        builder: (context, state) {
          state.mapOrNull(
            salesScreenCustomerSelectionBuildState: (value) {
                
            });
          return ListView.separated(itemBuilder: (context,index){}, separatorBuilder: (context,index){}, itemCount: itemCount)
        },
      ),
    );
  }
}
