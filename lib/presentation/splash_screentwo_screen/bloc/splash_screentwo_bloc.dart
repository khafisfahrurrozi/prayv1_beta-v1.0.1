import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:prayv1_beta/presentation/splash_screentwo_screen/models/splash_screentwo_model.dart';
part 'splash_screentwo_event.dart';
part 'splash_screentwo_state.dart';

/// A bloc that manages the state of a SplashScreentwo according to the event that is dispatched to it.
class SplashScreentwoBloc
    extends Bloc<SplashScreentwoEvent, SplashScreentwoState> {
  SplashScreentwoBloc(SplashScreentwoState initialState) : super(initialState) {
    on<SplashScreentwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashScreentwoInitialEvent event,
    Emitter<SplashScreentwoState> emit,
  ) async {}
}
