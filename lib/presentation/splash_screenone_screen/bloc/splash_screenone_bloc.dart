import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:prayv1_beta/presentation/splash_screenone_screen/models/splash_screenone_model.dart';
part 'splash_screenone_event.dart';
part 'splash_screenone_state.dart';

/// A bloc that manages the state of a SplashScreenone according to the event that is dispatched to it.
class SplashScreenoneBloc
    extends Bloc<SplashScreenoneEvent, SplashScreenoneState> {
  SplashScreenoneBloc(SplashScreenoneState initialState) : super(initialState) {
    on<SplashScreenoneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashScreenoneInitialEvent event,
    Emitter<SplashScreenoneState> emit,
  ) async {}
}
