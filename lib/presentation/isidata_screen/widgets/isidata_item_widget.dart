import '../models/isidata_item_model.dart';
import 'package:flutter/material.dart';
import 'package:prayv1_beta/core/app_export.dart';

// ignore: must_be_immutable
class IsidataItemWidget extends StatelessWidget {
  IsidataItemWidget(
    this.isidataItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  IsidataItemModel isidataItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Text(
      "msg_isikan_alamat_sesuai".tr,
      style: theme.textTheme.bodySmall,
    );
  }
}
