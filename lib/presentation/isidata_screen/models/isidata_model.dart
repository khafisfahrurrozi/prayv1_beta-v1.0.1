// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'isidata_item_model.dart';

/// This class defines the variables used in the [isidata_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class IsidataModel extends Equatable {
  IsidataModel({this.isidataItemList = const []}) {}

  List<IsidataItemModel> isidataItemList;

  IsidataModel copyWith({List<IsidataItemModel>? isidataItemList}) {
    return IsidataModel(
      isidataItemList: isidataItemList ?? this.isidataItemList,
    );
  }

  @override
  List<Object?> get props => [isidataItemList];
}
