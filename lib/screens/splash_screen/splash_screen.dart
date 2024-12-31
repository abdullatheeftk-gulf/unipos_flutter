import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/screens/splash_screen/cubit/splash_cubit.dart';
import 'package:unipos_flutter/util/routes.dart';
import 'package:unipos_flutter/util/snackbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool showProgressBar = false;
    return BlocProvider(
      create: (context) => SplashCubit(
        apiRepository: RepositoryProvider.of(context),
        dio: RepositoryProvider.of(context),
      ),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          state.mapOrNull(splashListenState: (value) {
            final message = value.errorMessage;
            if (message != null) {
              showSnackBar(context: context, message: message);
            }
            if (value.navigateToHome) {
              Navigator.of(context).pushReplacementNamed(home);
            }
          });
        },
        listenWhen: (previous, current) {
          return current.maybeWhen(
              orElse: () => false, splashListenState: (a, b) => true);
        },
        buildWhen: (previous, current) {
          return current.maybeWhen(
              orElse: () => false, splashBuildState: (a, b, c) => true);
        },
        builder: (context, state) {
          state.mapOrNull(splashBuildState: (value) {
            showProgressBar = value.isWelcomeMessageLoading;
          });
          return Scaffold(
            floatingActionButton: showProgressBar?CircularProgressIndicator():null,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: Center(
              child: Text(
                'Unipospro',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
