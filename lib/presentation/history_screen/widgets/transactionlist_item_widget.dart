import '../models/transactionlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';

// ignore: must_be_immutable
class TransactionlistItemWidget extends StatelessWidget {
  TransactionlistItemWidget(
    this.transactionlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TransactionlistItemModel transactionlistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          SizedBox(
            width: 182.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: transactionlistItemModelObj?.userImage,
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  radius: BorderRadius.circular(
                    30.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 3.v,
                    bottom: 2.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactionlistItemModelObj.alexandria!,
                        style: theme.textTheme.bodyLarge,
                      ),
                      SizedBox(height: 5.v),
                      Text(
                        transactionlistItemModelObj.duration!,
                        style: CustomTextStyles.bodyMediumGray50002,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 104.h,
              top: 16.v,
              bottom: 16.v,
            ),
            child: Text(
              transactionlistItemModelObj.rpCounter!,
              textAlign: TextAlign.right,
              style: theme.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
