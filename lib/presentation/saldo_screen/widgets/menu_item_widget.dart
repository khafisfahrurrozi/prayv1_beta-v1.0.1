import '../models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';
import 'package:prayv1_beta/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class MenuItemWidget extends StatelessWidget {
  MenuItemWidget(
    this.menuItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MenuItemModel menuItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.v),
        child: Column(
          children: [
            CustomIconButton(
              height: 60.adaptSize,
              width: 60.adaptSize,
              padding: EdgeInsets.all(12.h),
              child: CustomImageView(
                imagePath: menuItemModelObj?.transferOne,
              ),
            ),
            SizedBox(height: 15.v),
            Text(
              menuItemModelObj.transfer!,
              style: CustomTextStyles.bodyLargeBlack90002,
            ),
          ],
        ),
      ),
    );
  }
}
