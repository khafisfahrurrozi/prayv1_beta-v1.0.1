import 'bloc/edit_profil_bloc.dart';
import 'models/edit_profil_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/core/utils/validation_functions.dart';
import 'package:prayv1_beta/presentation/home_page/home_page.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_title.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_trailing_image.dart';
import 'package:prayv1_beta/widgets/app_bar/custom_app_bar.dart';
import 'package:prayv1_beta/widgets/custom_bottom_bar.dart';
import 'package:prayv1_beta/widgets/custom_text_form_field.dart';

class EditProfilScreen extends StatelessWidget {
  EditProfilScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<EditProfilBloc>(
      create: (context) => EditProfilBloc(EditProfilState(
        editProfilModelObj: EditProfilModel(),
      ))
        ..add(EditProfilInitialEvent()),
      child: EditProfilScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
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
                height: 504.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 94.v,
                        ),
                        decoration: AppDecoration.fillGray.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL50,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 60.v),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                "lbl_nama".tr,
                                style: CustomTextStyles.bodyMediumGray500,
                              ),
                            ),
                            SizedBox(height: 12.v),
                            _buildEditProfile(context),
                            SizedBox(height: 16.v),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                "lbl_email_address".tr,
                                style: CustomTextStyles.bodyMediumGray500,
                              ),
                            ),
                            SizedBox(height: 13.v),
                            _buildEmail(context),
                            SizedBox(height: 16.v),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                "lbl_phone_number".tr,
                                style: CustomTextStyles.bodyMediumGray500,
                              ),
                            ),
                            SizedBox(height: 13.v),
                            _buildPhoneNumber(context),
                            SizedBox(height: 16.v),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h),
                              child: Text(
                                "lbl_birth_date".tr,
                                style: CustomTextStyles.bodyMediumBluegray400,
                              ),
                            ),
                            SizedBox(height: 9.v),
                            _buildMonth(context),
                          ],
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle72,
                      height: 51.v,
                      width: 344.h,
                      alignment: Alignment.bottomCenter,
                    ),
                    _buildHome(context),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 86.h,
                          top: 2.v,
                          right: 131.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90.adaptSize,
                              width: 90.adaptSize,
                              margin: EdgeInsets.only(left: 20.h),
                              decoration: AppDecoration.fillGray90001.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder45,
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle5,
                                height: 90.adaptSize,
                                width: 90.adaptSize,
                                radius: BorderRadius.circular(
                                  45.h,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            SizedBox(height: 15.v),
                            Text(
                              "msg_khafis_fahrurrozi".tr,
                              style: CustomTextStyles.titleMediumGray900,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 51.v,
      leadingWidth: 50.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgTelevision,
        margin: EdgeInsets.only(
          left: 12.h,
          top: 8.v,
          bottom: 9.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_edit_profil".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFill293,
          margin: EdgeInsets.fromLTRB(23.h, 21.v, 23.h, 10.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEditProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child:
          BlocSelector<EditProfilBloc, EditProfilState, TextEditingController?>(
        selector: (state) => state.editProfileController,
        builder: (context, editProfileController) {
          return CustomTextFormField(
            controller: editProfileController,
            hintText: "msg_khafis_fahrurrozi".tr,
            hintStyle: theme.textTheme.bodyMedium!,
            prefix: Container(
              margin: EdgeInsets.only(
                top: 1.v,
                right: 16.h,
                bottom: 11.v,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgLockGray500,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 33.v,
            ),
            contentPadding: EdgeInsets.only(right: 30.h),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child:
          BlocSelector<EditProfilBloc, EditProfilState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
            controller: emailController,
            hintText: "msg_khafis34_gmail_com".tr,
            hintStyle: theme.textTheme.bodyMedium!,
            textInputType: TextInputType.emailAddress,
            prefix: Container(
              margin: EdgeInsets.only(
                right: 16.h,
                bottom: 11.v,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgEmailsEmailmailletter,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 33.v,
            ),
            validator: (value) {
              if (value == null || (!isValidEmail(value, isRequired: true))) {
                return "err_msg_please_enter_valid_email".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.only(
              top: 1.v,
              right: 30.h,
              bottom: 1.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child:
          BlocSelector<EditProfilBloc, EditProfilState, TextEditingController?>(
        selector: (state) => state.phoneNumberController,
        builder: (context, phoneNumberController) {
          return CustomTextFormField(
            controller: phoneNumberController,
            hintText: "lbl_081171266338".tr,
            hintStyle: theme.textTheme.bodyMedium!,
            textInputType: TextInputType.phone,
            prefix: Container(
              margin: EdgeInsets.only(
                top: 1.v,
                right: 16.h,
                bottom: 11.v,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgPhonesPhoneCall,
                height: 22.adaptSize,
                width: 22.adaptSize,
              ),
            ),
            prefixConstraints: BoxConstraints(
              maxHeight: 33.v,
            ),
            validator: (value) {
              if (!isValidPhone(value)) {
                return "err_msg_please_enter_valid_phone_number".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.only(right: 30.h),
            borderDecoration: TextFormFieldStyleHelper.underLineGray,
            filled: false,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyEight(BuildContext context) {
    return BlocSelector<EditProfilBloc, EditProfilState,
        TextEditingController?>(
      selector: (state) => state.twentyEightController,
      builder: (context, twentyEightController) {
        return CustomTextFormField(
          width: 82.h,
          controller: twentyEightController,
          hintText: "lbl_september".tr,
          hintStyle: theme.textTheme.bodyMedium!,
          contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
          borderDecoration: TextFormFieldStyleHelper.underLineGray,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildZipcode(BuildContext context) {
    return BlocSelector<EditProfilBloc, EditProfilState,
        TextEditingController?>(
      selector: (state) => state.zipcodeController,
      builder: (context, zipcodeController) {
        return CustomTextFormField(
          width: 82.h,
          controller: zipcodeController,
          hintText: "lbl_2000".tr,
          hintStyle: theme.textTheme.bodyMedium!,
          textInputAction: TextInputAction.done,
          contentPadding: EdgeInsets.symmetric(horizontal: 23.h),
          borderDecoration: TextFormFieldStyleHelper.underLineGray,
          filled: false,
        );
      },
    );
  }

  /// Section Widget
  Widget _buildMonth(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "lbl_28".tr,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 82.h,
                child: Divider(
                  color: appTheme.gray10001,
                ),
              ),
            ],
          ),
          _buildTwentyEight(context),
          _buildZipcode(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHome(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 16.h),
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 17.v,
        ),
        decoration: AppDecoration.fillBlueGray,
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup1,
          height: 20.v,
          width: 300.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Subtract:
        return AppRoutes.homePage;
      case BottomBarEnum.User:
        return "/";
      case BottomBarEnum.Calendar:
        return "/";
      case BottomBarEnum.Lock:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
