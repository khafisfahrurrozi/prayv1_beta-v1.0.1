import '../../../core/app_export.dart';

/// This class is used in the [menu_item_widget] screen.
class MenuItemModel {
  MenuItemModel({
    this.transferOne,
    this.transfer,
    this.id,
  }) {
    transferOne = transferOne ?? ImageConstant.imgTransfer1;
    transfer = transfer ?? "Transfer";
    id = id ?? "";
  }

  String? transferOne;

  String? transfer;

  String? id;
}
