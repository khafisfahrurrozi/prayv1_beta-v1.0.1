import '../isidata_screen/widgets/isidata_item_widget.dart';
import 'bloc/isidata_bloc.dart';
import 'models/isidata_item_model.dart';
import 'models/isidata_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/widgets/custom_elevated_button.dart';
import 'package:prayv1_beta/widgets/custom_text_form_field.dart';

class IsidataScreen extends StatelessWidget {
  const IsidataScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<IsidataBloc>(
      create: (context) => IsidataBloc(IsidataState(
        isidataModelObj: IsidataModel(),
      ))
        ..add(IsidataInitialEvent()),
      child: IsidataScreen(),
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
                  style: CustomTextStyles.bodySmallLilitaOneOnErrorContainer,
                ),
                SizedBox(height: 12.v),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.h,
                    vertical: 5.v,
                  ),
                  decoration: AppDecoration.fillGray.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "lbl_isi_data_diri".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 7.v),
                      _buildEnterYourUsername(context),
                      SizedBox(height: 1.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: Text(
                            "msg_isikan_nama_sesuai".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      _buildMonth1(context),
                      SizedBox(height: 15.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 28.h),
                          child: Text(
                            "msg_isi_tanggal_lahir".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildPhoneNumberField(context),
                      SizedBox(height: 1.v),
                      _buildIsidata(context),
                      SizedBox(height: 25.v),
                      _buildPasswordField(context),
                      SizedBox(height: 36.v),
                      _buildDaftar(context),
                      SizedBox(height: 26.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEnterYourUsername(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 23.h,
        right: 22.h,
      ),
      child: BlocSelector<IsidataBloc, IsidataState, TextEditingController?>(
        selector: (state) => state.enterYourUsernameController,
        builder: (context, enterYourUsernameController) {
          return CustomTextFormField(
            controller: enterYourUsernameController,
            hintText: "lbl_masukan_nama".tr,
            hintStyle: CustomTextStyles.bodyMediumBlack9000213_3,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildMonth(BuildContext context) {
    return BlocSelector<IsidataBloc, IsidataState, TextEditingController?>(
      selector: (state) => state.monthController,
      builder: (context, monthController) {
        return CustomTextFormField(
          width: 82.h,
          controller: monthController,
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
  Widget _buildMonth1(BuildContext context) {
    return SizedBox(
      height: 29.v,
      width: 335.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 82.h,
              child: Divider(
                color: appTheme.gray10001,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 82.h,
              child: Divider(
                color: appTheme.gray10001,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 33.h,
                right: 23.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.v),
                    child: Text(
                      "lbl_28".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Spacer(
                    flex: 52,
                  ),
                  _buildMonth(context),
                  Spacer(
                    flex: 47,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.v),
                    child: Text(
                      "lbl_2000".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 23.h,
        right: 22.h,
      ),
      child: BlocSelector<IsidataBloc, IsidataState, TextEditingController?>(
        selector: (state) => state.phoneNumberFieldController,
        builder: (context, phoneNumberFieldController) {
          return CustomTextFormField(
            controller: phoneNumberFieldController,
            hintText: "msg_isi_alamat_lengkap".tr,
            maxLines: 5,
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildIsidata(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: BlocSelector<IsidataBloc, IsidataState, IsidataModel?>(
        selector: (state) => state.isidataModelObj,
        builder: (context, isidataModelObj) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 7.v,
              );
            },
            itemCount: isidataModelObj?.isidataItemList.length ?? 0,
            itemBuilder: (context, index) {
              IsidataItemModel model =
                  isidataModelObj?.isidataItemList[index] ?? IsidataItemModel();
              return IsidataItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 23.h,
        right: 21.h,
      ),
      child: BlocSelector<IsidataBloc, IsidataState, TextEditingController?>(
        selector: (state) => state.passwordFieldController,
        builder: (context, passwordFieldController) {
          return CustomTextFormField(
            controller: passwordFieldController,
            hintText: "msg_masukan_kata_sandi".tr,
            textInputAction: TextInputAction.done,
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
        left: 23.h,
        right: 22.h,
      ),
    );
  }
}
