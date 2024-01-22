// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'slider_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({this.sliderItemList = const []}) {}

  List<SliderItemModel> sliderItemList;

  HomeModel copyWith({List<SliderItemModel>? sliderItemList}) {
    return HomeModel(
      sliderItemList: sliderItemList ?? this.sliderItemList,
    );
  }

  @override
  List<Object?> get props => [sliderItemList];
}
