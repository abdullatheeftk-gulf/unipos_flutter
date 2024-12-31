part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.splashBuildState({
    @Default(null) String? welcomeMessage,
    @Default(false) bool isWelcomeMessageLoading,
    @Default(null) String? errorMessage,
  })=_SplashBuildState;

  const factory SplashState.splashListenState({
    @Default(null) String? errorMessage,
    @Default(false) bool navigateToHome,
  })=_SplashListenerState;

}
