// ignore_for_file: must_be_immutable

part of 'saldo_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Saldo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SaldoEvent extends Equatable {}

/// Event that is dispatched when the Saldo widget is first created.
class SaldoInitialEvent extends SaldoEvent {
  @override
  List<Object?> get props => [];
}
