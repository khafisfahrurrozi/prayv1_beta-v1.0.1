import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/slider_item_model.dart';
import 'package:prayv1_beta/presentation/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  List<SliderItemModel> fillSliderItemList() {
    return [
      SliderItemModel(image: ImageConstant.imgRectangle34625147),
      SliderItemModel(image: ImageConstant.imgRectangle34625148),
      SliderItemModel(image: ImageConstant.imgRectangle34625149)
    ];
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      sliderIndex: 0,
    ));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
      sliderItemList: fillSliderItemList(),
    )));
  }
}
