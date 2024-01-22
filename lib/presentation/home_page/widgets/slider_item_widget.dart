import '../models/slider_item_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';

// ignore: must_be_immutable
class SliderItemWidget extends StatelessWidget {
  SliderItemWidget(
    this.sliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderItemModel sliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: sliderItemModelObj?.image,
      height: 185.v,
      width: 360.h,
      radius: BorderRadius.circular(
        73.h,
      ),
      margin: EdgeInsets.only(bottom: 352.v),
    );
  }
}
