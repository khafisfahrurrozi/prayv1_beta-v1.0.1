// ignore_for_file: must_be_immutable

part of 'splash_screenone_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SplashScreenone widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SplashScreenoneEvent extends Equatable {}

/// Event that is dispatched when the SplashScreenone widget is first created.
class SplashScreenoneInitialEvent extends SplashScreenoneEvent {
  @override
  List<Object?> get props => [];
}
