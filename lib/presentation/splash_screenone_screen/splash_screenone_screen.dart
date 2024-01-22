import 'bloc/splash_screenone_bloc.dart';
import 'models/splash_screenone_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';

class SplashScreenoneScreen extends StatelessWidget {
  const SplashScreenoneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashScreenoneBloc>(
      create: (context) => SplashScreenoneBloc(SplashScreenoneState(
        splashScreenoneModelObj: SplashScreenoneModel(),
      ))
        ..add(SplashScreenoneInitialEvent()),
      child: SplashScreenoneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenoneBloc, SplashScreenoneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
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
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16.v),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 90.v,
                      width: 98.h,
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "msg_peduli_ramah_anak".tr,
                      style:
                          CustomTextStyles.bodyMediumLilitaOneOnErrorContainer,
                    ),
                    SizedBox(height: 23.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgImgsplash1,
                      height: 351.v,
                      width: 360.h,
                      radius: BorderRadius.circular(
                        111.h,
                      ),
                    ),
                    SizedBox(height: 22.v),
                    Text(
                      "msg_menjadi_hamba_yang".tr,
                      style:
                          CustomTextStyles.bodyLargeLilitaOneOnErrorContainer,
                    ),
                    SizedBox(height: 6.v),
                    Container(
                      width: 264.h,
                      margin: EdgeInsets.only(
                        left: 45.h,
                        right: 49.h,
                      ),
                      child: Text(
                        "msg_dengan_kita_berbagi".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodySmallOnErrorContainer,
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
