import '../models/menu1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Menu1ItemWidget extends StatelessWidget {
  Menu1ItemWidget(
    this.menu1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Menu1ItemModel menu1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(12.h),
            child: CustomImageView(
              imagePath: menu1ItemModelObj?.iconPhone,
            ),
          ),
          SizedBox(height: 15.v),
          Text(
            menu1ItemModelObj.pulsaData!,
            style: CustomTextStyles.bodyMediumBlack90002,
          ),
        ],
      ),
    );
  }
}
