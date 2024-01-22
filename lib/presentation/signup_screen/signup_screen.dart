import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/core/utils/validation_functions.dart';
import 'package:prayv1_beta/widgets/custom_elevated_button.dart';
import 'package:prayv1_beta/widgets/custom_outlined_button.dart';
import 'package:prayv1_beta/widgets/custom_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(SignupState(
        signupModelObj: SignupModel(),
      ))
        ..add(SignupInitialEvent()),
      child: SignupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1.02),
              colors: [
                appTheme.teal40002,
                appTheme.teal40001,
                theme.colorScheme.onError,
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(height: 8.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 34.v,
                      width: 38.h,
                    ),
                    SizedBox(height: 1.v),
                    Text(
                      "msg_peduli_ramah_anak".tr,
                      style:
                          CustomTextStyles.bodySmallLilitaOneOnErrorContainer,
                    ),
                    SizedBox(height: 12.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 29.h,
                        vertical: 3.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL50,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "lbl_buat_akun_baru".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 9.v),
                          _buildEnterAccountName(context),
                          SizedBox(height: 25.v),
                          _buildEmail(context),
                          SizedBox(height: 25.v),
                          _buildEnterNumber(context),
                          SizedBox(height: 25.v),
                          _buildEnterPassword(context),
                          SizedBox(height: 29.v),
                          _buildDaftar(context),
                          SizedBox(height: 15.v),
                          _buildLineField(context),
                          SizedBox(height: 8.v),
                          _buildDaftarDenganFacebook(context),
                          SizedBox(height: 14.v),
                          _buildDaftarDenganGoogle(context),
                          SizedBox(height: 21.v),
                          _buildAlreadyAccount(context),
                          SizedBox(height: 14.v),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEnterAccountName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      child: BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.enterAccountNameController,
        builder: (context, enterAccountNameController) {
          return CustomTextFormField(
            controller: enterAccountNameController,
            hintText: "msg_masukan_nama_akun".tr,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      child: BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
            controller: emailController,
            hintText: "msg_masukan_email_anda".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEnterNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      child: BlocSelector<SignupBloc, SignupState, TextEditingController?>(
        selector: (state) => state.enterNumberController,
        builder: (context, enterNumberController) {
          return CustomTextFormField(
            controller: enterNumberController,
            hintText: "msg_masukan_nomer_anda".tr,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEnterPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return CustomTextFormField(
            controller: state.enterPasswordController,
            hintText: "msg_masukan_kata_sandi".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                context.read<SignupBloc>().add(ChangePasswordVisibilityEvent(
                    value: !state.isShowPassword));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 10.v, 12.h, 10.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEyePasswordLogo,
                  height: 21.v,
                  width: 22.h,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 43.v,
            ),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
            obscureText: state.isShowPassword,
            contentPadding: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              bottom: 11.v,
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildDaftar(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_daftar".tr,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
    );
  }

  /// Section Widget
  Widget _buildLineField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 3.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            child: SizedBox(
              width: 107.h,
              child: Divider(),
            ),
          ),
          Text(
            "lbl_atau_dengan".tr,
            style: CustomTextStyles.bodySmallBlack90002,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            child: SizedBox(
              width: 107.h,
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDaftarDenganFacebook(BuildContext context) {
    return CustomElevatedButton(
      text: "msg_daftar_dengan_facebook".tr,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 17.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgFacebookLogo,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillBlueA,
    );
  }

  /// Section Widget
  Widget _buildDaftarDenganGoogle(BuildContext context) {
    return CustomOutlinedButton(
      text: "msg_daftar_dengan_google".tr,
      margin: EdgeInsets.only(
        left: 5.h,
        right: 4.h,
      ),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 30.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogleLogo,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAlreadyAccount(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Text(
              "msg_sudah_punya_akun".tr,
              style: CustomTextStyles.titleMediumManropeBlack900,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: Text(
              "lbl_masuk_akun".tr,
              style: CustomTextStyles.titleSmallManropeBlue800,
            ),
          ),
        ],
      ),
    );
  }
}
