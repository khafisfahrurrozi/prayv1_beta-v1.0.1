import '../history_screen/widgets/transactionlist_item_widget.dart';
import 'bloc/history_bloc.dart';
import 'models/history_model.dart';
import 'models/transactionlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/presentation/home_page/home_page.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_title.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_trailing_image.dart';
import 'package:prayv1_beta/widgets/app_bar/custom_app_bar.dart';
import 'package:prayv1_beta/widgets/custom_bottom_bar.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc(HistoryState(
        historyModelObj: HistoryModel(),
      ))
        ..add(HistoryInitialEvent()),
      child: HistoryScreen(),
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
            height: 504.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildTransactionList(context),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle71,
                  height: 51.v,
                  width: 344.h,
                  alignment: Alignment.bottomCenter,
                ),
                _buildHome(context),
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
        text: "lbl_rekam_transaksi".tr,
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
  Widget _buildTransactionList(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 28.v),
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 53.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL50,
        ),
        child: BlocSelector<HistoryBloc, HistoryState, HistoryModel?>(
          selector: (state) => state.historyModelObj,
          builder: (context, historyModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 24.v,
                );
              },
              itemCount: historyModelObj?.transactionlistItemList.length ?? 0,
              itemBuilder: (context, index) {
                TransactionlistItemModel model =
                    historyModelObj?.transactionlistItemList[index] ??
                        TransactionlistItemModel();
                return TransactionlistItemWidget(
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
