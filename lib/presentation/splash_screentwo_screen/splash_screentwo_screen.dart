import 'bloc/splash_screentwo_bloc.dart';
import 'models/splash_screentwo_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';

class SplashScreentwoScreen extends StatelessWidget {
  const SplashScreentwoScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashScreentwoBloc>(
      create: (context) => SplashScreentwoBloc(SplashScreentwoState(
        splashScreentwoModelObj: SplashScreentwoModel(),
      ))
        ..add(SplashScreentwoInitialEvent()),
      child: SplashScreentwoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreentwoBloc, SplashScreentwoState>(
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
                padding: EdgeInsets.symmetric(vertical: 17.v),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgTelevision,
                      height: 90.v,
                      width: 98.h,
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      "msg_peduli_ramah_anak".tr,
                      style:
                          CustomTextStyles.bodyMediumLilitaOneOnErrorContainer,
                    ),
                    SizedBox(height: 23.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgImgsplash2,
                      height: 351.v,
                      width: 360.h,
                      radius: BorderRadius.circular(
                        111.h,
                      ),
                    ),
                    SizedBox(height: 21.v),
                    Text(
                      "msg_motivasi_untuk_lebih".tr,
                      style:
                          CustomTextStyles.bodyMediumLilitaOneOnErrorContainer,
                    ),
                    SizedBox(height: 6.v),
                    SizedBox(
                      width: 249.h,
                      child: Text(
                        "msg_jika_kita_sudah".tr,
                        maxLines: 3,
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
