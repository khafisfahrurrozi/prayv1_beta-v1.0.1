import '../../../core/app_export.dart';

/// This class is used in the [slider_item_widget] screen.
class SliderItemModel {
  SliderItemModel({
    this.image,
    this.id,
  }) {
    image = image ?? ImageConstant.imgRectangle34625147;
    id = id ?? "";
  }

  String? image;

  String? id;
}
