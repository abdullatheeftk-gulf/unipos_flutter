import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/repositories/api/api_repository.dart';
import 'package:unipos_flutter/repositories/api/http_routes.dart';
import 'package:unipos_flutter/util/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Dio(BaseOptions(baseUrl: HttpRoutes.BASE_URL)),
        ),
        RepositoryProvider(
          create: (context) =>
              ApiRepository(dio: RepositoryProvider.of<Dio>(context)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Unipospro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        routes: routes,
        initialRoute: routes.keys.first,
      ),
    );
  }
}
