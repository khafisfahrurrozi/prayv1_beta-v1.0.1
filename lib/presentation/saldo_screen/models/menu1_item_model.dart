import '../../../core/app_export.dart';

/// This class is used in the [menu1_item_widget] screen.
class Menu1ItemModel {
  Menu1ItemModel({
    this.iconPhone,
    this.pulsaData,
    this.id,
  }) {
    iconPhone = iconPhone ?? ImageConstant.imgIconPhone;
    pulsaData = pulsaData ?? "Pulsa & Data";
    id = id ?? "";
  }

  String? iconPhone;

  String? pulsaData;

  String? id;
}
