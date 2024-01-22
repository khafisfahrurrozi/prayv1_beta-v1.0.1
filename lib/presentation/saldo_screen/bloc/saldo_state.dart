// ignore_for_file: must_be_immutable

part of 'saldo_bloc.dart';

/// Represents the state of Saldo in the application.
class SaldoState extends Equatable {
  SaldoState({this.saldoModelObj});

  SaldoModel? saldoModelObj;

  @override
  List<Object?> get props => [
        saldoModelObj,
      ];
  SaldoState copyWith({SaldoModel? saldoModelObj}) {
    return SaldoState(
      saldoModelObj: saldoModelObj ?? this.saldoModelObj,
    );
  }
}
