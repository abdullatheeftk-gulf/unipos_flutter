import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unipos_flutter/util/log_functions.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  
  HomeCubit() : super(HomeState.initial());

  void changeScreen(int index) {
    warningLog( "index: $index");
    emit(HomeState.onScreenChanged(index));
  }

}
