// ignore_for_file: must_be_immutable

part of 'edit_profil_bloc.dart';

/// Represents the state of EditProfil in the application.
class EditProfilState extends Equatable {
  EditProfilState({
    this.editProfileController,
    this.emailController,
    this.phoneNumberController,
    this.twentyEightController,
    this.zipcodeController,
    this.editProfilModelObj,
  });

  TextEditingController? editProfileController;

  TextEditingController? emailController;

  TextEditingController? phoneNumberController;

  TextEditingController? twentyEightController;

  TextEditingController? zipcodeController;

  EditProfilModel? editProfilModelObj;

  @override
  List<Object?> get props => [
        editProfileController,
        emailController,
        phoneNumberController,
        twentyEightController,
        zipcodeController,
        editProfilModelObj,
      ];
  EditProfilState copyWith({
    TextEditingController? editProfileController,
    TextEditingController? emailController,
    TextEditingController? phoneNumberController,
    TextEditingController? twentyEightController,
    TextEditingController? zipcodeController,
    EditProfilModel? editProfilModelObj,
  }) {
    return EditProfilState(
      editProfileController:
          editProfileController ?? this.editProfileController,
      emailController: emailController ?? this.emailController,
      phoneNumberController:
          phoneNumberController ?? this.phoneNumberController,
      twentyEightController:
          twentyEightController ?? this.twentyEightController,
      zipcodeController: zipcodeController ?? this.zipcodeController,
      editProfilModelObj: editProfilModelObj ?? this.editProfilModelObj,
    );
  }
}
