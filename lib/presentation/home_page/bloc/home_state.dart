// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.sliderIndex = 0,
    this.homeModelObj,
  });

  TextEditingController? searchController;

  HomeModel? homeModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        searchController,
        sliderIndex,
        homeModelObj,
      ];
  HomeState copyWith({
    TextEditingController? searchController,
    int? sliderIndex,
    HomeModel? homeModelObj,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      sliderIndex: sliderIndex ?? this.sliderIndex,
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}
