import '../saldo_screen/widgets/menu1_item_widget.dart';
import '../saldo_screen/widgets/menu_item_widget.dart';
import 'bloc/saldo_bloc.dart';
import 'models/menu1_item_model.dart';
import 'models/menu_item_model.dart';
import 'models/saldo_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/presentation/home_page/home_page.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_title.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_trailing_image.dart';
import 'package:prayv1_beta/widgets/app_bar/custom_app_bar.dart';
import 'package:prayv1_beta/widgets/custom_bottom_bar.dart';

class SaldoScreen extends StatelessWidget {
  SaldoScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<SaldoBloc>(
      create: (context) => SaldoBloc(SaldoState(
        saldoModelObj: SaldoModel(),
      ))
        ..add(SaldoInitialEvent()),
      child: SaldoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
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
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text(
                    "lbl_saldo_anda".tr,
                    style: CustomTextStyles.bodyMediumOnErrorContainer,
                  ),
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 22.h),
                  child: Text(
                    "lbl_rp_500_000".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 19.v),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                        vertical: 9.v,
                      ),
                      decoration: AppDecoration.fillGray.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL50,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildMenu(context),
                          SizedBox(height: 8.v),
                          Text(
                            "lbl_pembayaran".tr,
                            style: CustomTextStyles.titleLargeGray90002,
                          ),
                          SizedBox(height: 89.v),
                          _buildMenu1(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
      leadingWidth: 50.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgTelevision,
        margin: EdgeInsets.only(
          left: 12.h,
          top: 8.v,
          bottom: 11.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "msg_selamat_datang_khafis".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFill293,
          margin: EdgeInsets.fromLTRB(23.h, 21.v, 23.h, 12.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildMenu(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 102.v,
        child: BlocSelector<SaldoBloc, SaldoState, SaldoModel?>(
          selector: (state) => state.saldoModelObj,
          builder: (context, saldoModelObj) {
            return ListView.separated(
              padding: EdgeInsets.only(
                left: 22.h,
                right: 15.h,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 47.h,
                );
              },
              itemCount: saldoModelObj?.menuItemList.length ?? 0,
              itemBuilder: (context, index) {
                MenuItemModel model =
                    saldoModelObj?.menuItemList[index] ?? MenuItemModel();
                return MenuItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMenu1(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 14.h),
        child: BlocSelector<SaldoBloc, SaldoState, SaldoModel?>(
          selector: (state) => state.saldoModelObj,
          builder: (context, saldoModelObj) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 97.v,
                crossAxisCount: 3,
                mainAxisSpacing: 35.h,
                crossAxisSpacing: 35.h,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: saldoModelObj?.menu1ItemList.length ?? 0,
              itemBuilder: (context, index) {
                Menu1ItemModel model =
                    saldoModelObj?.menu1ItemList[index] ?? Menu1ItemModel();
                return Menu1ItemWidget(
                  model,
                );
              },
            );
          },
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
