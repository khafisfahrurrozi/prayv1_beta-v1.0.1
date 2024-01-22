// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.enterAccountNameController,
    this.emailController,
    this.enterNumberController,
    this.enterPasswordController,
    this.isShowPassword = true,
    this.signupModelObj,
  });

  TextEditingController? enterAccountNameController;

  TextEditingController? emailController;

  TextEditingController? enterNumberController;

  TextEditingController? enterPasswordController;

  SignupModel? signupModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        enterAccountNameController,
        emailController,
        enterNumberController,
        enterPasswordController,
        isShowPassword,
        signupModelObj,
      ];
  SignupState copyWith({
    TextEditingController? enterAccountNameController,
    TextEditingController? emailController,
    TextEditingController? enterNumberController,
    TextEditingController? enterPasswordController,
    bool? isShowPassword,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      enterAccountNameController:
          enterAccountNameController ?? this.enterAccountNameController,
      emailController: emailController ?? this.emailController,
      enterNumberController:
          enterNumberController ?? this.enterNumberController,
      enterPasswordController:
          enterPasswordController ?? this.enterPasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
