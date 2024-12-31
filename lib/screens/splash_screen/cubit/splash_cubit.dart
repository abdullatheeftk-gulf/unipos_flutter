import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/repositories/api/api_repository.dart';
import 'package:unipos_flutter/util/log_functions.dart';
part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  final ApiRepository apiRepository;
  final Dio dio;
  SplashCubit({required this.apiRepository, required this.dio})
      : super(SplashState.initial()) {
    _getWelcomeMessage();
  }

  void _getWelcomeMessage() async {
    try {
      emit(SplashState.splashBuildState(isWelcomeMessageLoading: true));
      final welcomeMessage = await apiRepository.getWelcomeMessage(dio);
      emit(SplashState.splashBuildState(
          welcomeMessage: welcomeMessage, isWelcomeMessageLoading: false));
      await Future.delayed(const Duration(seconds: 8));
      emit(SplashState.splashListenState(navigateToHome: true));
    } catch (e) {
      emit(SplashState.splashBuildState(
          errorMessage: e.toString(), isWelcomeMessageLoading: false));
      emit(SplashState.splashListenState(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    debugLog('SplashCubit closed');
    return super.close();
  }
}
