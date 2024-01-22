import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/core/utils/validation_functions.dart';
import 'package:prayv1_beta/widgets/custom_checkbox_button.dart';
import 'package:prayv1_beta/widgets/custom_elevated_button.dart';
import 'package:prayv1_beta/widgets/custom_outlined_button.dart';
import 'package:prayv1_beta/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
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
                    SizedBox(height: 9.v),
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
                    SizedBox(height: 11.v),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.h,
                        vertical: 11.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL50,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "msg_selamat_datang_kembali".tr,
                            style: theme.textTheme.titleLarge,
                          ),
                          SizedBox(height: 15.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Text(
                                "lbl_email".tr,
                                style: CustomTextStyles.bodyMediumGray700,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.v),
                          _buildEmailField(context),
                          SizedBox(height: 28.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "lbl_password".tr,
                                style: CustomTextStyles.bodyMediumGray700,
                              ),
                            ),
                          ),
                          SizedBox(height: 3.v),
                          _buildPasswordField(context),
                          SizedBox(height: 20.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 3.h,
                              right: 10.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildRememberMeCheckbox(context),
                                Text(
                                  "msg_lupa_kata_sandi".tr,
                                  style: CustomTextStyles
                                      .labelLargeOnPrimaryContainer,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 21.v),
                          _buildLoginButton(context),
                          SizedBox(height: 30.v),
                          _buildLineField(context),
                          SizedBox(height: 22.v),
                          _buildLoginWithFacebookButton(context),
                          SizedBox(height: 14.v),
                          _buildLoginWithGoogleButton(context),
                          SizedBox(height: 21.v),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 3.h,
                              right: 9.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Text(
                                    "msg_tidak_punya_akun".tr,
                                    style: CustomTextStyles
                                        .titleMediumManropeBlack900,
                                  ),
                                ),
                                Text(
                                  "lbl_buat_akun".tr,
                                  style: CustomTextStyles
                                      .titleMediumManropeBlue800,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 11.v),
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
  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 1.h,
      ),
      child: BlocSelector<LoginBloc, LoginState, TextEditingController?>(
        selector: (state) => state.emailFieldController,
        builder: (context, emailFieldController) {
          return CustomTextFormField(
            controller: emailFieldController,
            hintText: "msg_example_gmail_com".tr,
            hintStyle: CustomTextStyles.bodyMediumBlack9000213,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 3.h,
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return CustomTextFormField(
            controller: state.passwordFieldController,
            hintText: "msg_masukan_kata_sandi".tr,
            hintStyle: CustomTextStyles.bodyMediumBlack9000213_1,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: InkWell(
              onTap: () {
                context.read<LoginBloc>().add(ChangePasswordVisibilityEvent(
                    value: !state.isShowPassword));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 15.v, 13.h, 12.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgEyeIcon,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 44.v,
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
              left: 9.h,
              top: 12.v,
              bottom: 12.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL10,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildRememberMeCheckbox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.v),
      child: BlocSelector<LoginBloc, LoginState, bool?>(
        selector: (state) => state.rememberMeCheckbox,
        builder: (context, rememberMeCheckbox) {
          return CustomCheckboxButton(
            text: "msg_ingat_kata_sandi".tr,
            value: rememberMeCheckbox,
            onChange: (value) {
              context.read<LoginBloc>().add(ChangeCheckBoxEvent(value: value));
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_masuk".tr,
      margin: EdgeInsets.symmetric(horizontal: 3.h),
    );
  }

  /// Section Widget
  Widget _buildLineField(BuildContext context) {
    return Row(
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
    );
  }

  /// Section Widget
  Widget _buildLoginWithFacebookButton(BuildContext context) {
    return CustomElevatedButton(
      text: "msg_masuk_dengan_facebook".tr,
      margin: EdgeInsets.symmetric(horizontal: 3.h),
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
  Widget _buildLoginWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "msg_masuk_dengan_google".tr,
      margin: EdgeInsets.only(left: 3.h),
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
}
