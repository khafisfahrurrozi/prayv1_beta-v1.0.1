// ignore_for_file: must_be_immutable

part of 'isidata_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Isidata widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class IsidataEvent extends Equatable {}

/// Event that is dispatched when the Isidata widget is first created.
class IsidataInitialEvent extends IsidataEvent {
  @override
  List<Object?> get props => [];
}
