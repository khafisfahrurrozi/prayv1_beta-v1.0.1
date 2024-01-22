// ignore_for_file: must_be_immutable

part of 'splash_screentwo_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SplashScreentwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SplashScreentwoEvent extends Equatable {}

/// Event that is dispatched when the SplashScreentwo widget is first created.
class SplashScreentwoInitialEvent extends SplashScreentwoEvent {
  @override
  List<Object?> get props => [];
}
