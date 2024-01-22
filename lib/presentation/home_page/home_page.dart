import '../home_page/widgets/slider_item_widget.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'models/slider_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_leading_image.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_title.dart';
import 'package:prayv1_beta/widgets/app_bar/appbar_trailing_image.dart';
import 'package:prayv1_beta/widgets/app_bar/custom_app_bar.dart';
import 'package:prayv1_beta/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
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
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 4.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.h),
                  child:
                      BlocSelector<HomeBloc, HomeState, TextEditingController?>(
                    selector: (state) => state.searchController,
                    builder: (context, searchController) {
                      return CustomSearchView(
                        controller: searchController,
                        hintText: "lbl_cari_berita".tr,
                      );
                    },
                  ),
                ),
                SizedBox(height: 13.v),
                _buildSlider(context),
                _buildStack(context),
              ],
            ),
          ),
        ),
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
  Widget _buildSlider(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CarouselSlider.builder(
          options: CarouselOptions(
            height: 537.v,
            initialPage: 0,
            autoPlay: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (
              index,
              reason,
            ) {
              state.sliderIndex = index;
            },
          ),
          itemCount: state.homeModelObj?.sliderItemList.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            SliderItemModel model =
                state.homeModelObj?.sliderItemList[index] ?? SliderItemModel();
            return SliderItemWidget(
              model,
            );
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildStack(BuildContext context) {
    return SizedBox(
      height: 54.v,
      width: 344.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle7,
            height: 51.v,
            width: 344.h,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
