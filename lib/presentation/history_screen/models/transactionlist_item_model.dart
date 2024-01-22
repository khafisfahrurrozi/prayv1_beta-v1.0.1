import '../../../core/app_export.dart';

/// This class is used in the [transactionlist_item_widget] screen.
class TransactionlistItemModel {
  TransactionlistItemModel({
    this.userImage,
    this.alexandria,
    this.duration,
    this.rpCounter,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgEllipse16;
    alexandria = alexandria ?? "Alexandria";
    duration = duration ?? "Yesterday · 19:12";
    rpCounter = rpCounter ?? "Rp 600.000";
    id = id ?? "";
  }

  String? userImage;

  String? alexandria;

  String? duration;

  String? rpCounter;

  String? id;
}
