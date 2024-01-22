import '../../../core/app_export.dart';

/// This class is used in the [isidata_item_widget] screen.
class IsidataItemModel {
  IsidataItemModel({this.id}) {
    id = id ?? "";
  }

  String? id;
}
