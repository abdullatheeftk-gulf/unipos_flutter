import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/models/api/customer/customer.dart';
import 'package:unipos_flutter/repositories/api/api_repository.dart';
import 'package:unipos_flutter/repositories/shared/shared_repository.dart';
import 'package:unipos_flutter/screens/entries/childrens/sales_screen/cubit/sales_screen_cubit.dart';
import 'package:unipos_flutter/util/date_time_format.dart';
import 'package:unipos_flutter/util/routes.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final _formKey = GlobalKey<FormState>();

  String _date = dateFormat(DateTime.now());
  String _time = timeFormat(DateTime.now());

  Customer? _selectedCustomer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SalesScreenCubit(
        apiRepository: context.read<ApiRepository>(),
        dio: context.read<Dio>(),
        sharedRepository: context.read<SharedRepository>(),
      ),
      child: BlocConsumer<SalesScreenCubit, SalesScreenState>(
        listenWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            slaesScreenListenerState: (a) => true,
          );
        },
        listener: (context, state) {
          // TODO: implement listener
        },
        buildWhen: (prev, cur) {
          return cur.maybeWhen(
            orElse: () => false,
            slaesScreenBuildState: (a, b, c, d) => true,
          );
        },
        builder: (context, state) {
          final salesScreenCubit = context.read<SalesScreenCubit>();

          state.mapOrNull(
            slaesScreenBuildState: (value) {
              _date = value.date;
              _time = value.time;
              _selectedCustomer = value.selectedCustomer;
            },
          );

          return Scaffold(
            appBar: AppBar(
              title: Text("Sales"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Date and Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _date,
                            style: TextStyle(color: Colors.blue),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          IconButton(
                            onPressed: () {
                              salesScreenCubit.changeDate(context);
                            },
                            icon: Icon(Icons.calendar_month),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _time,
                            style: TextStyle(color: Colors.blue),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          IconButton(
                            onPressed: () {
                              salesScreenCubit.changeTime(context);
                            },
                            icon: Icon(Icons.calendar_month),
                          )
                        ],
                      )
                    ],
                  ),

                  // Customers
                  const SizedBox(
                    height: 8,
                  ),

                  TextFormField(
                    readOnly: true,
                    onTap: () {},
                    decoration: InputDecoration(
                      labelText: "Customer",
                      hintText: "Select a Customer",
                      labelStyle: TextStyle(color: Colors.black38),
                      floatingLabelStyle: TextStyle(color: Colors.black87),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, customerSelection);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ),
                    controller: TextEditingController(
                      text: _selectedCustomer?.name ?? "",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

 
}
