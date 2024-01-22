// ignore_for_file: must_be_immutable

part of 'isidata_bloc.dart';

/// Represents the state of Isidata in the application.
class IsidataState extends Equatable {
  IsidataState({
    this.enterYourUsernameController,
    this.monthController,
    this.phoneNumberFieldController,
    this.passwordFieldController,
    this.isidataModelObj,
  });

  TextEditingController? enterYourUsernameController;

  TextEditingController? monthController;

  TextEditingController? phoneNumberFieldController;

  TextEditingController? passwordFieldController;

  IsidataModel? isidataModelObj;

  @override
  List<Object?> get props => [
        enterYourUsernameController,
        monthController,
        phoneNumberFieldController,
        passwordFieldController,
        isidataModelObj,
      ];
  IsidataState copyWith({
    TextEditingController? enterYourUsernameController,
    TextEditingController? monthController,
    TextEditingController? phoneNumberFieldController,
    TextEditingController? passwordFieldController,
    IsidataModel? isidataModelObj,
  }) {
    return IsidataState(
      enterYourUsernameController:
          enterYourUsernameController ?? this.enterYourUsernameController,
      monthController: monthController ?? this.monthController,
      phoneNumberFieldController:
          phoneNumberFieldController ?? this.phoneNumberFieldController,
      passwordFieldController:
          passwordFieldController ?? this.passwordFieldController,
      isidataModelObj: isidataModelObj ?? this.isidataModelObj,
    );
  }
}
